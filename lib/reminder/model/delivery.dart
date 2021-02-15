import 'package:freezed_annotation/freezed_annotation.dart';

import 'reminder.dart';

part 'delivery.freezed.dart';

@freezed
abstract class Delivery with _$Delivery {
  const factory Delivery({@required Reminder reminder, @nullable String status}) = DeliveryValue;
}
