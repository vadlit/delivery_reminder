import 'package:flutter/widgets.dart';

import 'progress_bar_widget.dart';

class InProgressWidget extends StatefulWidget {
  const InProgressWidget({
    Key key,
  }) : super(key: key);

  @override
  _InProgressWidgetState createState() => _InProgressWidgetState();
}

class _InProgressWidgetState extends State<InProgressWidget>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  final double waveGap = 5.0;
  Animation<double> _animation;
  AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    _progressController.forward();

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _progressController.reset();
      } else if (status == AnimationStatus.dismissed) {
        _progressController.forward();
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: waveGap).animate(_progressController)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(child: ProgressBarWidget(waveRadius: waveRadius)),
    );
  }
}
