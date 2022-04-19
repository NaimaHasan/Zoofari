import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:zoofari/View/Screens/FavoriteScreen.dart';
import 'package:zoofari/View/Screens/HomeScreen.dart';
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
      expect(favoriteButtonOnAnimalOnFavoriteScreen, findsNothing);


      await tester.tapAt(Offset(30, 30));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Search activity', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final searchBar = find.byKey(ValueKey('Search Bar'));
      await tester.tap(searchBar);
      await tester.pumpAndSettle();
      final textFormField = find.byType(TextFormField);
      
      // submittins an empty text
      await tester.enterText(textFormField, "");
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();


      // submitting a text that won't likely return any results
      await tester.tap(searchBar);
      await tester.pumpAndSettle();
      await tester.enterText(textFormField, "asdfoi asdofia oaisdfp aosdfij apsdoif");
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // back to home screen
      await tester.tapAt(Offset(30, 30));
      await tester.pumpAndSettle();
      
      // submitting a query that is likely to get back results
      await tester.tap(searchBar);
      await tester.pumpAndSettle();
      await tester.enterText(textFormField, "cape lion");
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(Duration(seconds: 2));
    });  


    // testWidgets('Animal details screen', (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();
    //   final topAnimal = find.byKey(ValueKey('Home Top Animal'));
    //   await tester.tap(topAnimal);
    //   await tester.pumpAndSettle();
    //   await tester.
    // });  
  });
}