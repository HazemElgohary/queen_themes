import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queen_themes/queen_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QThemeBuilder(
      builder: (ctx, theme) => MaterialApp(
        theme: theme,
        home: Scaffold(
          body: Center(
            child: Text(QTheme.currentIndex.toString()),
          ),
        ),
      ),
    );
  }
}

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await (await SharedPreferences.getInstance()).clear();

    await QTheme.boot();
  });
  testWidgets(
    'it rebuilds after theme Changes',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const TestApp());

      final counterZero = find.text('0');
      expect(counterZero, findsOneWidget);

      await QTheme.next();
      await tester.pumpAndSettle();

      final counterOne = find.text('1');
      expect(counterOne, findsOneWidget);
    },
  );
  testWidgets(
    'it can loop between themes for ever',
    (WidgetTester tester) async {
      /// * pump the app
      await tester.pumpWidget(const TestApp());

      final counterZero = find.text('0');
      expect(counterZero, findsOneWidget);

      await QTheme.next();
      await tester.pumpAndSettle();

      final counterOne = find.text('1');
      expect(counterOne, findsOneWidget);
      await QTheme.next();
      await tester.pumpAndSettle();

      final counterZero2 = find.text('0');
      expect(counterZero2, findsOneWidget);

      await QTheme.next();
      await tester.pumpAndSettle();

      final counterOne2 = find.text('1');
      expect(counterOne2, findsOneWidget);
    },
  );
}
