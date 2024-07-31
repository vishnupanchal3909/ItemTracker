import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../Provider/ItemProvider.dart';
import 'ItemListScreen.dart';

void main() {
  testWidgets('Item List Screen displays items', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ItemProvider()..addItem('Test Item', 'Test Description'),
        child: MaterialApp(home: ItemListScreen()),
      ),
    );

    expect(find.text('Test Item'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
  });

  testWidgets('Adding an item shows it in the list', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ItemProvider(),
        child: MaterialApp(home: ItemListScreen()),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.enterText(find.byType(TextField).at(0), 'New Item');
    await tester.enterText(find.byType(TextField).at(1), 'New Description');
    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('New Item'), findsOneWidget);
    expect(find.text('New Description'), findsOneWidget);
  });
}
