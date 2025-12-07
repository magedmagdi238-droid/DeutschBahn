
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Dashboard renders correctly', (WidgetTester tester) async {
    // Set mock initial values for SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for the UI to settle after loading data.
    await tester.pumpAndSettle();

    // Verify that the app title is displayed.
    expect(find.text('DeutschBahn'), findsOneWidget);

    // Verify that the stats grid is displayed.
    expect(find.byIcon(Icons.bolt), findsOneWidget);
    expect(find.byIcon(Icons.health_and_safety), findsOneWidget);
    expect(find.byIcon(Icons.warning), findsOneWidget);
    expect(find.byIcon(Icons.school), findsOneWidget);

    // Verify that the 'Resume Journey' button is displayed.
    expect(find.text('Resume Journey'), findsOneWidget);
  });
}
