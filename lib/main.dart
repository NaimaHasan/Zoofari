import 'package:flutter/material.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';
import 'package:zoofari/View/Screens/SearchResultsScreen.dart';

import 'View/Auxiliary/Helpers/ColorGenerator.dart';
import 'View/Screens/FavoriteScreen.dart';
import 'View/Screens/HomeScreen.dart';

import 'Model/Data Definitions/Animal.dart';
void main() {
  runApp(const MyApp());
}

// void main() async {
//   var sth = await OnlineRepository.fetchSearchedAnimals("black dog");

//   print(sth?[0]?.commonName);
//   // print(sth?.commonName);
// }


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoofari',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF9FC5F8,
          ColorGenerator.getSwatch(
            Color(0xFF4c8e82),
          ),
        ),
        primaryColor: MaterialColor(
          0xFF4c8e82,
          ColorGenerator.getSwatch(
            Color(0xFF4c8e82),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF4c8e82),
        ),
        backgroundColor: const Color(0xFFe2f9f5),
        dividerColor: Colors.white54,
        fontFamily: 'Quicksand',

      ),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        CategoricalAnimalScreen.routeName: (ctx) =>
            CategoricalAnimalScreen(title: ''),
        AnimalDetailsScreen.routeName: (ctx) => AnimalDetailsScreen(),
        SearchResultsScreen.routeName: (ctx) => SearchResultsScreen(
              searchKey: '',
            ),
      },
    );
  }
}
