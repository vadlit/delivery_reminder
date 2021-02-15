import 'package:flutter/widgets.dart';

import '../theme.dart';

class ErrorPadWidget extends StatelessWidget {
  final String text;

  const ErrorPadWidget({
    Key key,
    @required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
      decoration: BoxDecoration(
          color: DrColors.errorDim,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Text(
        text,
        style: DrTextStyles.textInputError,
      ),
    );
  }
}