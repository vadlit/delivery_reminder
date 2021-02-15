import 'package:delivery_reminder/common/view/navigation/navigation_utils.dart';
import 'package:delivery_reminder/common/view/theme.dart';
import 'package:delivery_reminder/common/view/utils.dart';
import 'package:delivery_reminder/reminder/data/reminder_storage.dart';
import 'package:delivery_reminder/reminder/service/notification_scheduler.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:delivery_reminder/reminder/view/reminder_list_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/state_management/base_store.dart';

void main() async {
  BaseStore.initReactiveWritePolicy();

  WidgetsFlutterBinding.ensureInitialized();
  //configureDependencies();
  runApp(DeliveryReminderApp());
}

class DeliveryReminderApp extends StatelessWidget {
  const DeliveryReminderApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeSystemBarsColors(statusBarIconsBrightness: Brightness.dark);

    return MultiProvider(
      providers: [
        Provider(create: (_) => ReminderStorage(), dispose: (_, ReminderStorage storage) => storage.close()),
        Provider(create: (_) => NotificationScheduler()),
        Provider(create: (ctx) => ReminderRepository(ctx.read<ReminderStorage>(), ctx.read<NotificationScheduler>())),
        //Provider(create: (_) => PochtaFacade(), dispose: (_, PochtaFacade pochta) => pochta.dispose()),
        Provider(create: (ctx) => ReminderListStore.create(repository: ctx.read<ReminderRepository>())),
      ],
      child: MaterialApp(
        title: 'Delivery Reminder',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale.fromSubtags(languageCode: 'en'),
          Locale.fromSubtags(languageCode: 'ru'),
        ],
        navigatorKey: rootNavigatorKey,
        theme: ThemeData(
          dividerColor: Colors.transparent,
          scaffoldBackgroundColor: DrColors.bgLight,
          backgroundColor: DrColors.bgLight,
          primarySwatch: DrColors.primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ReminderListPage(),
      ),
    );
  }
}
