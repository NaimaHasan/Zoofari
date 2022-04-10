import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:zoofari/Controller/CategoricalController/AnimalProviders/AmphibianProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/BirdProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/FishProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/MammalProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/ReptileProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/SearchResultProvider.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';


import 'package:zoofari/View/Screens/EmptyScreen.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';
import 'package:zoofari/View/Screens/SearchResultsScreen.dart';

import 'View/Auxiliary/Helpers/ColorGenerator.dart';
import 'View/Auxiliary/Helpers/DummyAnimalList.dart';
import 'View/Screens/FavoriteScreen.dart';
import 'View/Screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager.initialize();
  DummyAnimalList();
  runApp(MultiProvider( 
    providers: [
      ChangeNotifierProvider.value(value: Randoms()),
      ChangeNotifierProvider.value(value: Endangered()),
      ChangeNotifierProvider.value(value: Mammals()),
      ChangeNotifierProvider.value(value: Amphibians()),
      ChangeNotifierProvider.value(value: Bird()),
      ChangeNotifierProvider.value(value: Fish()),
      ChangeNotifierProvider.value(value: Reptiles()),
      ChangeNotifierProvider.value(value: SearchController()),
    ],
    child: MyApp(),
  ));
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
        appBarTheme: AppBarTheme(
            color: Color(0xFF88bbb2)
        ),
        backgroundColor: const Color(0xFFe9f8f5),
        dividerColor: Color(0xFF4c8e82),
        fontFamily: 'Quicksand',
      ),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        CategoricalAnimalScreen.routeName: (ctx) =>
            CategoricalAnimalScreen(title: ''),
        AnimalDetailsScreen.routeName: (ctx) => AnimalDetailsScreen(),
        SearchResultsScreen.routeName: (ctx) =>
            SearchResultsScreen(searchKey: ''),
        EmptyScreen.routeName: (ctx) => EmptyScreen(imageData: ''),
      },
    );
  }
}
