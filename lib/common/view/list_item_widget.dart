import 'package:flutter/widgets.dart';

import 'theme.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, DrSizes.listItemSpacing),
        padding: const EdgeInsets.symmetric(horizontal: DrSizes.screenPaddingStandard),
        child: child);
  }
}
