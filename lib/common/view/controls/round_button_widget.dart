import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundButtonWidget extends StatelessWidget {
  final double diameter;
  final double iconSize;
  final Color bgColor;
  final Widget icon;
  final GestureTapCallback onTap;

  const RoundButtonWidget({
    @required this.diameter,
    @required this.iconSize,
    @required this.bgColor,
    @required this.icon,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: diameter,
      height: diameter,
      child: RawMaterialButton(
          onPressed: onTap,
          elevation: 0,
          disabledElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          fillColor: bgColor,
          shape: CircleBorder(),
          child: Container(
            width: diameter,
            height: diameter,
            child: Container(
              width: iconSize,
              height: iconSize,
              alignment: Alignment.center,
              child: icon,
            ),
          )
      ),
    );
  }
}
