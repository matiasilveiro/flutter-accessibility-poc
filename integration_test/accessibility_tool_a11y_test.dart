import 'package:accessibility_poc/screens/accessibility_tool_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const testWidget = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: AccessibilityToolDemo())
  );

  testWidgets('tap target guidelines test', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    // Checks that tappable nodes have a minimum size of 48 by 48 pixels
    // for Android.
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

    // Checks that tappable nodes have a minimum size of 44 by 44 pixels
    // for iOS.
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));

    // Checks that touch targets with a tap or long press action are labeled.
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  });

  testWidgets('text contrast guidelines test', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    // Checks whether semantic nodes meet the minimum text contrast levels.
    // The recommended text contrast is 3:1 for larger text
    // (18 point and above regular).
    await expectLater(tester, meetsGuideline(textContrastGuideline));
  });

  testWidgets('semantics test', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    // Checks whether semantic nodes matches a regular expression.
    // It can be used with a string, matching by string equality.
    expect(find.bySemanticsLabel(RegExp('Enter a search term')), findsOneWidget);

    handle.dispose();
  });
}
