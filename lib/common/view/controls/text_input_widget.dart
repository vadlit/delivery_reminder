import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mobx/mobx.dart';

import '../theme.dart';
import 'form_input.dart';

class TextInputWidget extends StatefulWidget {
  final FormInputPosition position;
  final String helperText;
  final String prefixText;
  final ScrollController parentScrollController;
  final FocusScopeNode nextFieldFocusScope;
  final TextInputType textInputType;
  final Observable<String> value;
  final bool isReadOnly;
  final String validationError;
  final FormFieldSetter<String> onSave;
  final ValueChanged<String> onFormSubmitted;
  final ValueChanged<String> onChanged;
  final String placeholder;

  const TextInputWidget({
    Key key,
    @required this.position,
    @required this.nextFieldFocusScope,
    this.parentScrollController,
    this.helperText,
    this.prefixText,
    this.isReadOnly = false,
    this.textInputType = TextInputType.text,
    this.value,
    this.validationError,
    this.onSave,
    this.onFormSubmitted,
    this.onChanged,
    this.placeholder,
  }) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  Dispose _valueDisposer;
  final _controller = TextEditingController();
  final _keyboardVisibility = KeyboardVisibilityController();
  final FocusNode _focus = FocusNode();

  StreamSubscription<bool> _keyboardVisibilitySubscription;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _valueDisposer = widget.value.observe((ChangeNotification<String> changeNotification) {
        _controller.text = changeNotification.newValue;
      }, fireImmediately: true);
    }
    _focus.addListener(_onFocusChange);
    _keyboardVisibilitySubscription = _keyboardVisibility.onChange.listen(
      (isKeyboardVisible) {
        if (isKeyboardVisible && _focus.hasFocus && widget.parentScrollController != null) {
          Future.delayed(Duration(milliseconds: 300)).then((value) {
            widget.parentScrollController.position.ensureVisible(
              _focus.context.findRenderObject(),
              duration: Duration(milliseconds: 200),
            );
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _valueDisposer?.call();
    _focus.removeListener(_onFocusChange);
    _keyboardVisibilitySubscription.cancel();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FormInput(
      focus: _focus,
      position: widget.position,
      helperText: widget.helperText,
      validationError: widget.validationError,
      prefixText: widget.prefixText,
      placeholder: widget.placeholder,
      builder: (decoration) => TextFormField(
        readOnly: widget.isReadOnly,
        keyboardType: widget.textInputType,
        textInputAction: widget.nextFieldFocusScope == null ? TextInputAction.done : TextInputAction.next,
        inputFormatters:
            widget.textInputType == TextInputType.number || widget.textInputType == TextInputType.numberWithOptions()
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
        onEditingComplete: widget.nextFieldFocusScope == null ? null : widget.nextFieldFocusScope.nextFocus,
        onSaved: widget.onSave,
        autovalidateMode: AutovalidateMode.disabled,
        onFieldSubmitted: widget.onFormSubmitted,
        onChanged: widget.onChanged,
        style: DrTextStyles.sfBody,
        controller: _controller,
        focusNode: _focus,
        decoration: decoration,
      ),
    );
  }
}
