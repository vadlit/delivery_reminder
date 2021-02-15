import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'theme.dart';

class EmptyDataWidget extends StatelessWidget {
  final SvgPicture svgPicture;
  final String description;

  const EmptyDataWidget({Key key, @required this.svgPicture, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 128.66, height: 111.43, child: svgPicture),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 22.57, 0, 0),
          width: 263,
          child: Text(
            description,
            style: DrTextStyles.sfBody,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
