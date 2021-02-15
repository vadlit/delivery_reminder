import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/dr_colors.dart';

void changeSystemBarsColors({@required Brightness statusBarIconsBrightness}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // status bar color
    statusBarBrightness: statusBarIconsBrightness,
    //status bar brightness
    statusBarIconBrightness: statusBarIconsBrightness,
    //status barIcon Brightness

    systemNavigationBarColor: DrColors.bgLight,
    // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
}

extension StageExtensions on Stage {
  String toText() {
    switch(this) {
      case Stage.delivery:
        return 'Жду доставку';
      case Stage.test:
        return 'Проверяю';
    }
    return null;
  }
}

extension BuildContextExtensions on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;
}
