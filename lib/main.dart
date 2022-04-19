import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/CategoricalAnimalProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/HomeTopAnimalProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/SearchResultProvider.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';
import 'package:zoofari/View/Screens/SearchResultsScreen.dart';

import 'Model/Data Definitions/Animal.dart';
import 'View/Auxiliary/Helpers/ColorGenerator.dart';
import 'View/Auxiliary/Helpers/DummyAnimalList.dart';
import 'View/Screens/FavoriteScreen.dart';
import 'View/Screens/HomeScreen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await DatabaseManager.initialize();
    DummyAnimalList();

    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Randoms()),
        ChangeNotifierProvider.value(value: Endangered()),
        ChangeNotifierProvider.value(value: SearchController()),
        ChangeNotifierProvider.value(value: HomeTopRandomAnimal()),
        ChangeNotifierProvider.value(value: CategoricalProvider()),
      ],
      child: MyApp(),
    ));
    // catching SocketException if no internet found
  } on SocketException {
    // try again with refresh
    main();
  }
}

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
        appBarTheme: AppBarTheme(color: Color(0xFF88bbb2)),
        backgroundColor: const Color(0xFFf6fffd),
        dividerColor: Color(0xFF88bbb2),
        fontFamily: 'Quicksand',
      ),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        CategoricalAnimalScreen.routeName: (ctx) =>
            CategoricalAnimalScreen(title: ''),
        AnimalDetailsScreen.routeName: (ctx) => AnimalDetailsScreen(
              animal: Animal.emptyAnimal(),
            ),
        SearchResultsScreen.routeName: (ctx) =>
            SearchResultsScreen(searchKey: '')
      },
    );
  }
}
