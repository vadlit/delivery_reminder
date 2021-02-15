import 'dart:ui';

import 'package:delivery_reminder/common/view/controls/full_screen_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../theme.dart';
import 'dr_popup_route.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

void showDrPopup(BuildContext context, {@required Widget child, List<SingleChildWidget> providers}) {
  final dialog = FullScreenDialogWidget(child: child);
  DrPopupRoute route = (providers != null && providers.isNotEmpty)
      ? DrPopupRoute(
          child: MultiProvider(
          providers: providers,
          child: dialog,
        ))
      : DrPopupRoute(child: dialog);

  changeSystemBarsColors(statusBarIconsBrightness: Brightness.light);

  Navigator.of(context).push(route).then((_) {
    changeSystemBarsColors(statusBarIconsBrightness: Brightness.dark);
  });
}