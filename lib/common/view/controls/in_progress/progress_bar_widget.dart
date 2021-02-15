import 'package:flutter/widgets.dart';

import '../../theme.dart';
import 'infinite_progress_bar_painter.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    Key key,
    @required this.waveRadius,
  }) : super(key: key);

  final double waveRadius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(64, 64),
      painter: InfiniteProgressBarPainter(
          color: DrColors.gridDivider,
          waveRadius: waveRadius),
    );
  }
}