import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';

import 'utils.dart';

void main() {
  LeakTesting.settings =
      LeakTesting.settings.withIgnored(createdByTestHelpers: true);
  LeakTesting.enable();

  testWidgets('Do not wrap words', (tester) async {
    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 20,
      widget: const SizedBox(
        width: 100,
        child: AutoSizeText(
          'XXXXX XXXXX',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
    var height = tester.getSize(find.byType(RichText)).height;
    expect(height, 40);

    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 10,
      widget: const SizedBox(
        width: 40,
        child: AutoSizeText(
          'XXXXX',
          style: TextStyle(fontSize: 25),
          minFontSize: 10,
          maxLines: 10,
        ),
      ),
    );
    height = tester.getSize(find.byType(RichText)).height;
    expect(height, 20);
  });

  testWidgets('Wrap words', (tester) async {
    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 30,
      widget: const SizedBox(
        width: 90,
        child: AutoSizeText(
          'XXXXXX',
          style: TextStyle(fontSize: 40),
          maxLines: 2,
          wrapWords: true,
        ),
      ),
    );
    final height = tester.getSize(find.byType(RichText)).height;
    expect(height, 60);
  });
}
