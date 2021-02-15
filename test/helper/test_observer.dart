import 'package:flutter/widgets.dart';

typedef OnObservation = void Function(Route<dynamic> route, Route<dynamic> previousRoute);

class TestObserver extends NavigatorObserver {
  OnObservation onPushed;
  OnObservation onPopped;
  OnObservation onRemoved;
  OnObservation onReplaced;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPushed != null) {
      onPushed(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPopped != null) {
      onPopped(route, previousRoute);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onRemoved != null) {
      onRemoved(route, previousRoute);
    }
  }

  @override
  void didReplace({ Route<dynamic> oldRoute, Route<dynamic> newRoute }) {
    if (onReplaced != null) {
      onReplaced(newRoute, oldRoute);
    }
  }
}