import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

class DrPopupHeader extends StatelessWidget {
  final Widget child;
  final String title;
  final Color bgColor;

  const DrPopupHeader({Key key, this.child, this.title, this.bgColor})
      : assert((child != null) != (title != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: DrSizes.screenPaddingStandard),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(DrSizes.popupRounding),
            topRight: const Radius.circular(DrSizes.popupRounding),
          )),
      child: child ?? Center(child: Text(title, style: DrTextStyles.bodyBold)),
    );
  }
}
