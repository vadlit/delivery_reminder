import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:delivery_reminder/common/dart/call_extensions.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../theme.dart';
import 'form_input.dart';

class DateInputWidget extends StatefulWidget {
  final FormInputPosition position;
  final String helperText;
  final String prefixText;
  final FocusScopeNode nextFieldFocusScope;
  final Observable<DateTime> value;
  final String validationError;
  final FormFieldSetter<DateTime> onSave;
  final ValueChanged<String> onFormSubmitted;
  final ValueChanged<String> onChanged;
  final String placeholder;

  const DateInputWidget({
    Key key,
    @required this.position,
    @required this.nextFieldFocusScope,
    this.helperText,
    this.prefixText,
    this.value,
    this.validationError,
    this.onSave,
    this.onFormSubmitted,
    this.onChanged,
    this.placeholder,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<DateInputWidget> {
  Dispose _valueDisposer;
  final _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  DateFormat formatter;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _valueDisposer?.call();
    _focus.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formatter = DateFormat.MMMEd(context.languageCode);
    if (widget.value != null) {
      _valueDisposer = widget.value.observe((ChangeNotification<DateTime> changeNotification) {
        _controller.text = changeNotification.newValue == null ? null : formatter.format(changeNotification.newValue);
      }, fireImmediately: true);
    }
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FormInput(
        focus: _focus,
        position: widget.position,
        helperText: widget.helperText,
        validationError: widget.validationError,
        prefixText: widget.prefixText,
        placeholder: widget.placeholder,
        onTap: _showDatePicker,
        builder: (decoration) => TextFormField(
          onTap: _showDatePicker,
          readOnly: true,
          autovalidateMode: AutovalidateMode.disabled,
          onChanged: widget.onChanged,
          style: DrTextStyles.sfBody,
          controller: _controller,
          focusNode: _focus,
          decoration: decoration,
        ),
      ),
    );
  }

  void _showDatePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now().let((it) => DateTime(it.year, it.month, it.day).add(Duration(days: 1))),
        onConfirm: (date) {
      widget.onSave(date);
    }, currentTime: widget.value?.value, locale: LocaleType.ru);
  }
}
