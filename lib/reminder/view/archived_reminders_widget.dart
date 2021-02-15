import 'package:delivery_reminder/common/view/list_item_widget.dart';
import 'package:delivery_reminder/common/view/theme.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'delivery_widget.dart';

final archivedRemindersBottomKey = GlobalKey();

class ArchivedRemindersWidget extends StatefulWidget {
  const ArchivedRemindersWidget({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ArchivedRemindersWidget> with SingleTickerProviderStateMixin {
  static const Duration _animationDuration = Duration(milliseconds: 200);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _quarterTween = Tween<double>(begin: 0.0, end: 0.25);

  AnimationController _archivedAnimationController;
  Animation<double> _iconTurns;

  @override
  void initState() {
    _archivedAnimationController = AnimationController(duration: _animationDuration, vsync: this);
    _iconTurns = _archivedAnimationController.drive(_quarterTween.chain(_easeInTween));
    final isExpanded = PageStorage.of(context)?.readState(context) as bool ?? false;
    if (isExpanded) {
      _archivedAnimationController.value = 1;
    }
    super.initState();
  }

  @override
  void dispose() {
    _archivedAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      key: PageStorageKey('reminder_archived_list'),
      onExpansionChanged: (expanded) {
        if (expanded) {
          _archivedAnimationController.forward();
          Future.delayed(_animationDuration + const Duration(milliseconds: 100), () {
            Scrollable.ensureVisible(archivedRemindersBottomKey.currentContext);
          });
        } else {
          _archivedAnimationController.reverse();
        }
        setState(() {
          PageStorage.of(context)?.writeState(context, expanded);
        });
      },
      childrenPadding: EdgeInsets.zero,
      tilePadding: const EdgeInsets.symmetric(horizontal: DrSizes.screenPaddingStandard),
      title: const Text('Архив', style: DrTextStyles.bodyTextRegular),
      trailing: _buildExpandButton(),
      children: [_buildArchivedList()],
    );
  }

  Widget _buildArchivedList() {
    return Observer(builder: (context) {
      final reminderListStore = context.watch<ReminderListStore>();
      if (reminderListStore.archivedList.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: DrSizes.screenPaddingStandard),
          child: Text('Архив пуст', style: DrTextStyles.footnote),
        );
      }
      return Column(
          children: reminderListStore.archivedList
              .map((it) => ListItemWidget(child: DeliveryWidget(delivery: it)))
              .toList(growable: false));
    });
  }

  Widget _buildExpandButton() {
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(Icons.navigate_next, color: DrColors.iconGroup),
    );
  }
}
