import 'package:delivery_reminder/common/view/controls/error_pad_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/material.dart';

void main() {
  testWidgets('Text is visible', (WidgetTester tester) async {
    // arrange
    final text = 'some text';

    // act
    await tester.pumpWidget(wrapInMaterial(ErrorPadWidget(text: text)));

    // assert
    expect(find.text(text), findsOneWidget);
  });
}
