import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final DrButtonStyle type;
  final GestureTapCallback onTap;

  const ButtonWidget({
    @required this.title,
    @required this.type,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    switch (type) {
      case DrButtonStyle.primary:
        bgColor = DrColors.primary;
        textColor = DrColors.textInverse;
        break;
      case DrButtonStyle.primaryDim:
        bgColor = DrColors.primaryDim;
        textColor = DrColors.textPrimary;
        break;
      case DrButtonStyle.alert:
        bgColor = DrColors.alert;
        textColor = DrColors.textInverse;
        break;
    }

    return FlatButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        color: bgColor,
        textColor: textColor,
        disabledColor: DrColors.disabled,
        disabledTextColor: DrColors.textDisabled,
        shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(8)),
        child: Container(
          height: DrSizes.buttonHeight,
          padding: EdgeInsets.symmetric(horizontal: DrSizes.buttonHorizontalPadding),
          child: Center(child: Text(title, style: DrTextStyles.bodyNarrow)),
        ));
  }
}

enum DrButtonStyle { primary, primaryDim, alert }
