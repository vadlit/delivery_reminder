import 'package:delivery_reminder/common/view/navigation/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'test_observer.dart';

Widget wrapInMaterial(Widget child, [TestObserver testObserver]) {
  return MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale.fromSubtags(languageCode: 'ru'),
    ],
    navigatorObservers: testObserver == null ? const <NavigatorObserver>[] : <NavigatorObserver>[testObserver],
    navigatorKey: rootNavigatorKey,
    home: child,
  );
}
