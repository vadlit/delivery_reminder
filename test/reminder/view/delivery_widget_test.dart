import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:delivery_reminder/reminder/view/delivery_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/material.dart';

void main() {
  ReminderWaiting _buildFakeReminder() => Reminder.waiting(
      headers: ReminderHeaders(title: 'some title', description: 'some description'),
      stage: Stage.delivery,
      till: DateTime(2025, 02, 11, 15, 00));

  testWidgets('All fields are ok', (WidgetTester tester) async {
    // arrange
    final delivery = Delivery(reminder: _buildFakeReminder(), status: 'некий статус');

    // act
    await tester.pumpWidget(wrapInMaterial(DeliveryWidget(delivery: delivery)));

    // assert
    expect(find.text(delivery.reminder.headers.title), findsOneWidget);
    expect(find.text(delivery.reminder.headers.description), findsOneWidget);
    expect(find.text('Некий статус'), findsOneWidget);
    expect(find.text('Жду до 11 февр.'), findsOneWidget);
  });
}
