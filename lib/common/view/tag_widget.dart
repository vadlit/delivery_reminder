import 'package:flutter/widgets.dart';

import 'theme.dart';

class TagWidget extends StatelessWidget {
  final String text;

  const TagWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: DrColors.inputActive, borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: Text(text, style: DrTextStyles.tag));
  }
}
