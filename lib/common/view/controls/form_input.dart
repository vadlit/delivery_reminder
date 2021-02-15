import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

typedef FormInputBuilder = Widget Function(InputDecoration decoration);

class FormInput extends StatelessWidget {
  final FormInputBuilder builder;
  final FocusNode focus;
  final FormInputPosition position;
  final GestureTapCallback onTap;
  final String helperText;
  final String prefixText;
  final String placeholder;
  final String validationError;

  const FormInput(
      {Key key,
      @required this.builder,
      @required this.focus,
      @required this.position,
      this.onTap,
      this.helperText,
      this.prefixText,
      this.placeholder,
      this.validationError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filledWidgets = <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(DrSizes.textInputPaddingHorizontal, 8, DrSizes.textInputPaddingHorizontal, 10),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildMainArea(),
            )
          ]))
    ];

    if (validationError != null) {
      filledWidgets.insert(
          0,
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.05, 1],
                colors: [
                  Colors.transparent,
                  DrColors.textErrorGradientStart,
                  DrColors.textErrorGradientEnd,
                ],
              )),
            ),
          ));
    }

    return Padding(
      padding: position == FormInputPosition.top ? EdgeInsets.zero : const EdgeInsets.fromLTRB(0, 1, 0, 0),
      child: GestureDetector(
          onTap: () {
            focus.requestFocus();
            onTap?.call();
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: focus.hasFocus ? DrColors.inputActive : DrColors.inputRegular,
              borderRadius: getFormInputRadius(position),
            ),
            child: Stack(
              children: filledWidgets,
            ),
          )),
    );
  }

  List<Widget> _buildMainArea() {
    final columnWidgets = <Widget>[builder(_createDecoration())];

    if (helperText != null) {
      columnWidgets.insert(
          0,
          Text(
            helperText,
            style: DrTextStyles.textInputHelper,
          ));
    }

    return columnWidgets;
  }

  InputDecoration _createDecoration() {
    return InputDecoration(
      prefix: prefixText == null
          ? null
          : Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(
                prefixText,
                style: DrTextStyles.textInputPrefix,
              )),
      errorText: validationError,
      hintText: placeholder,
      hintStyle: DrTextStyles.textInputPlaceholder,
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: DrColors.errorDim), borderRadius: BorderRadius.zero),
      focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: DrColors.errorDim), borderRadius: BorderRadius.zero),
      errorMaxLines: 2,
      errorStyle: DrTextStyles.textInputError,
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
    );
  }
}

enum FormInputPosition { top, middle, bottom, alone }

BorderRadius getFormInputRadius(FormInputPosition position) {
  const radius = Radius.circular(8);
  switch (position) {
    case FormInputPosition.top:
      return const BorderRadius.vertical(top: radius);
    case FormInputPosition.middle:
      return const BorderRadius.all(Radius.zero);
    case FormInputPosition.bottom:
      return const BorderRadius.vertical(bottom: radius);
    case FormInputPosition.alone:
      return const BorderRadius.all(radius);
  }
  return null;
}