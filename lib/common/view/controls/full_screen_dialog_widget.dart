import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme.dart';
import 'keyboard_aware_container.dart';
import 'round_button_widget.dart';

class FullScreenDialogWidget extends StatelessWidget {
  final Widget child;

  const FullScreenDialogWidget({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          // TODO: try to grab dragdown code from _BottomSheetState
          // or consider https://pub.dev/packages/modal_bottom_sheet/example
          if (details.delta.dy >= 2) {
            Navigator.of(context).pop();
          }
        },
        child: KeyboardAwareContainer(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(child: _buildFrame(context, child)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFrame(BuildContext context, Widget body) {
    return Container(
      decoration: BoxDecoration(
          color: DrColors.bgLight,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(DrSizes.popupRounding),
            topRight: const Radius.circular(DrSizes.popupRounding),
          )),
      child: Stack(children: [_buildBodyStretcher(body), _buildCloseButton(context)]),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          1, DrSizes.screenPaddingStandard + 1, DrSizes.screenPaddingStandard + 1, DrSizes.screenPaddingStandard + 1),
      child: Align(
        alignment: Alignment.topRight,
        child: RoundButtonWidget(
          onTap: () {
            Navigator.of(context).pop();
          },
          diameter: DrSizes.roundButtonMediumDiameter,
          iconSize: DrSizes.roundButtonMediumIcon,
          bgColor: DrColors.inputRegular,
          icon: SvgPicture.asset(
            DrAssets.closeIcon,
            color: DrColors.textDefault,
          ),
        ),
      ),
    );
  }

  Widget _buildBodyStretcher(Widget body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [body],
    );
  }
}
