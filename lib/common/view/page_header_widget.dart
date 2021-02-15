import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'controls/round_button_widget.dart';
import 'theme.dart';

typedef BuildContextCallback = void Function(BuildContext context);

class PageHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final BuildContextCallback onTapRoundButton;
  final Animation<double> animation;

  const PageHeaderWidget({
    @required this.title,
    @required this.subtitle,
    this.icon,
    this.animation,
    this.onTapRoundButton,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DrSizes.pageHeaderSize,
      padding: EdgeInsets.fromLTRB(DrSizes.screenPaddingStandard, 0, DrSizes.screenPaddingStandard, 0),
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          _buildSubtitle(),
          animation == null
              ? _buildTitle(context)
              : FadeTransition(
                  opacity: CurvedAnimation(parent: animation, curve: Curves.easeInBack),
                  child: _buildTitle(context),
                )
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, DrSizes.pageHeaderVerticalPadding),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: DrTextStyles.titleXXL,
            ),
            RoundButtonWidget(
                diameter: DrSizes.roundButtonLargeDiameter,
                iconSize: DrSizes.roundButtonLargeIcon,
                bgColor: DrColors.drGrey,
                onTap: () => onTapRoundButton(context),
                icon: icon ??
                    SvgPicture.asset(
                      DrAssets.menuIcon,
                      color: DrColors.icon,
                    ))
          ],
        ),
      ),
    );
  }

  Align _buildSubtitle() {
    final topPaddingTween = animation == null
        ? 29.0
        : Tween<double>(begin: DrSizes.pageHeaderVerticalPaddingCollapsed, end: 29).evaluate(animation);
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, topPaddingTween, 0, 0),
        child: Text(
          subtitle,
          style: DrTextStyles.subtitle,
        ),
      ),
    );
  }
}
