import 'package:flutter_test/flutter_test.dart';

import 'package:catersync_app/main.dart';

void main() {
  testWidgets('app shows onboarding screen on first launch', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false));

    expect(find.text('Food for\nEveryone'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
  });
}
