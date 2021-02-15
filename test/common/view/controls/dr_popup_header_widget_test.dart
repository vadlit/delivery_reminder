import 'package:delivery_reminder/common/view/controls/dr_popup_header.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/material.dart';

void main() {
  testWidgets('Title is visible', (WidgetTester tester) async {
    // arrange
    final title = 'some title';

    // act
    await tester.pumpWidget(wrapInMaterial(DrPopupHeader(title: title)));

    // assert
    expect(find.text(title), findsOneWidget);
  });
}
