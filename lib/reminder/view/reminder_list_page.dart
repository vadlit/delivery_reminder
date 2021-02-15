import 'package:delivery_reminder/common/view/controls/error_pad_widget.dart';
import 'package:delivery_reminder/common/view/dr_sliver_page.dart';
import 'package:delivery_reminder/common/view/empty_data_widget.dart';
import 'package:delivery_reminder/common/view/list_item_widget.dart';
import 'package:delivery_reminder/common/view/theme.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:delivery_reminder/reminder/view/archived_reminders_widget.dart';
import 'package:delivery_reminder/reminder/view/delivery_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'add/add_reminder_widget.dart';
import 'notifications.dart';

class ReminderListPage extends StatefulWidget {
  ReminderListPage({Key key}) : super(key: key);

  @override
  _ReminderListPageState createState() => _ReminderListPageState();
}

class _ReminderListPageState extends State<ReminderListPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      initNotifications(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrSliverPage(
        title: 'Напоминания',
        subtitle: 'DELIVERY REMINDER',
        modelRefresher: (ctx, {isForcedByUser}) =>
            ctx.read<ReminderListStore>().refresh(isForcedByUser: isForcedByUser),
        sliverBlocsBuilder: (key) => [_buildList(key)],
        onTapRoundButton: (_) {
          // TODO
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddReminderPopup(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(Key key) {
    return Observer(builder: (context) {
      final reminderListStore = context.watch<ReminderListStore>();
      return reminderListStore.processState.when(
          ready: () => _buildFilledList(context, key, reminderListStore.waitingList),
          processing: () => _buildFilledList(context, key, reminderListStore.waitingList),
          error: (_) => SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DrSizes.screenPaddingStandard),
                  child: ErrorPadWidget(text: 'Что-то пошло не так'))));
    });
  }

  Widget _buildFilledList(BuildContext context, Key key, List<Delivery> waitingDeliveries) {
    final content = <Widget>[];
    if (waitingDeliveries.isEmpty) {
      content.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: DrSizes.screenPaddingStandard),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: EmptyDataWidget(
            description: 'Нет активных напоминаний',
            svgPicture: SvgPicture.asset(
              DrAssets.box,
              color: DrColors.iconInverse,
            ),
          ),
        ),
      ));
    } else {
      content.addAll(waitingDeliveries.map((it) => ListItemWidget(child: DeliveryWidget(delivery: it))));
    }
    content.add(_buildArchivedGroup());
    return SliverList(key: key, delegate: SliverChildListDelegate(content));
  }

  Widget _buildArchivedGroup() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 24 - DrSizes.listItemSpacing, 0, 24),
      child: Column(
        children: [
          ArchivedRemindersWidget(
            key: PageStorageKey('reminder_archived_group'),
          ),
          Container(key: archivedRemindersBottomKey)
        ],
      ),
    );
  }
}
