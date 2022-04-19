import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:zoofari/View/Screens/FavoriteScreen.dart';
import 'package:zoofari/main.dart' as app;
void main() {
  group('App test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('Home to favorite screen', (tester) async {
      app.main();
      // favorite an animal, navigate to favorite screen to view an animal on screen
      await tester.pumpAndSettle();
      final homeTopAnimalFavoriteButton = find.byKey(ValueKey('homeTopAnimalFavoriteButton'));
      await tester.tap(homeTopAnimalFavoriteButton);
      await tester.pumpAndSettle();

      final menu = find.byKey(ValueKey('homeFavoriteMenu'));
      final popMenuOption = find.byKey(ValueKey('popupMenuOption'));
      await tester.tap(menu);
      await tester.pumpAndSettle();
      await tester.tap(popMenuOption);
      await tester.pumpAndSettle();
      final favoriteButton = find.byKey(ValueKey('favoriteButtonOnFavoriteScreen'));
      expect(favoriteButton, findsOneWidget);

      // unfavoriting the animal on favorites screen
      await tester.pumpAndSettle();
      final favoriteButtonOnAnimalOnFavoriteScreen = find.byKey(ValueKey('favoriteButtonOnFavoriteScreen'));
      await tester.tap(favoriteButtonOnAnimalOnFavoriteScreen);
      await tester.pumpAndSettle();
      final confirmRemoval = find.byKey(ValueKey('confirmRemoval'));
      await tester.tap(confirmRemoval);
      await tester.pumpAndSettle();


      await tester.tapAt(Offset(30, 30));
      await tester.pumpAndSettle();
    });
  });
}