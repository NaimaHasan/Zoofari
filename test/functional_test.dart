// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:zoofari/main.dart';

void main() {
  group('functional test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'CategoricalAnimalScreen is rendered when an item in CarouselSlider of CategoricalScroll is tapped',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      // await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      // final favMenu = find.byKey(ValueKey('favoriteMenu'));
      // final favScreen = find.byType(FavoriteScreen);
      //
      // await tester.tap(favMenu);
      // await tester.pumpAndSettle();
      // // Verify that our counter starts at 0.
      // expect(favScreen, findsOneWidget);
    });
    testWidgets(
        'SearchResutlsScreen is rendered when a searchKey is entered in HomePage',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      // await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      // final favBtn = find.byKey(ValueKey('favoriteBtn'));
      //
      // await tester.tap(favBtn);
      await tester.pumpAndSettle();
      // Verify that our counter starts at 0.
      //expect(favScreen, findsOneWidget);
    });
    testWidgets(
        'AnimalDetailsScreen is rendered when a particular animal is clicked',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      // final favBtn = find.byKey(ValueKey('favoriteBtn'));
      //
      // await tester.tap(favBtn);
      await tester.pumpAndSettle();
      // Verify that our counter starts at 0.
      //expect(favScreen, findsOneWidget);
    });
  });
}