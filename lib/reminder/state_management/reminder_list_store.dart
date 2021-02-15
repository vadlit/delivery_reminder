import 'dart:async';

import 'package:delivery_reminder/common/state_management/base_store.dart';
import 'package:delivery_reminder/pochta/service/pochta_facade.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'reminder_list_store.g.dart';

abstract class ReminderListStore extends BaseStore with Store {
  final ReminderRepository _repository;

  ReminderListStore(this._repository) : assert(_repository != null);

  factory ReminderListStore.create({ReminderRepository repository}) {
    return _ReminderListStoreImpl(repository)..refresh(isForcedByUser: true);
  }

  final waitingList = ObservableList<Delivery>();
  final archivedList = ObservableList<Delivery>();

  @action
  Future refresh({bool isForcedByUser}) async {
    if (!isForcedByUser) {
      return;
    }

    return setProcessState(() async {
      final fetched = await _repository.getAll();

      waitingList.clear();
      final groupedByArchive = groupBy(fetched, (it) => it is ReminderArchived);
      final active = groupedByArchive[false];
      if (active != null && active.isNotEmpty) {
        final casted = active.cast<ReminderWaiting>();
        casted.sort((fst, snd) => fst.till.compareTo(snd.till));
        for (ReminderWaiting reminder in casted) {
          final String trackNumber = reminder.headers.trackNumber;
          String trackStatus;
          if (trackNumber != null) {
            trackStatus = await compute(getTrackStatus, trackNumber);
          }
          waitingList.add(Delivery(reminder: reminder, status: trackStatus));
        }
      }
      archivedList.clear();
      final archived = groupedByArchive[true];
      if (archived != null && archived.isNotEmpty) {
        final casted = archived.cast<ReminderArchived>();
        casted.sort((fst, snd) => fst.archivedAt.compareTo(snd.archivedAt));
        archivedList.addAll(casted.map((r) => Delivery(reminder: r)));
      }
      return true;
    });
  }
}

class _ReminderListStoreImpl extends ReminderListStore with _$_ReminderListStoreImpl {
  _ReminderListStoreImpl(ReminderRepository repository) : super(repository);
}
