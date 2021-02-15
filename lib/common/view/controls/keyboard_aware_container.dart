import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KeyboardAwareContainer extends StatelessWidget {
  final Widget child;

  const KeyboardAwareContainer({
    Key key,
    @required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectivePadding = MediaQuery.of(context).viewInsets + EdgeInsets.zero;

    return AnimatedPadding(
      padding: effectivePadding,
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: child,
      ),
    );
  }
}
