import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

/// Mostly copied from _CupertinoModalPopupRoute
class DrPopupRoute extends PopupRoute<void> {
  DrPopupRoute({this.child});

  final Widget child;

  @override
  final String barrierLabel = 'Dismiss';

  @override
  final Color barrierColor = DrColors.bgColorInverse;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  Animation<double> _animation;

  Tween<Offset> _offsetTween;

  @override
  Animation<double> createAnimation() {
    assert(_animation == null);
    _animation = CurvedAnimation(
      parent: super.createAnimation(),

      // These curves were initially measured from native iOS horizontal page
      // route animations and seemed to be a good match here as well.
      curve: Curves.easeOutQuad,
      reverseCurve: Curves.easeOutQuad.flipped,
    );
    _offsetTween = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    );
    return _animation;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return CupertinoUserInterfaceLevel(
      data: CupertinoUserInterfaceLevelData.elevated,
      child: child,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionalTranslation(
        translation: _offsetTween.evaluate(animation),
        child: child,
      ),
    );
  }
}
