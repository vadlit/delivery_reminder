import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'material.dart';
import 'test_observer.dart';

Widget wrapInPopup(Widget child, [TestObserver testObserver]) {
  return wrapInMaterial(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [child],
      ),
      testObserver);
}
