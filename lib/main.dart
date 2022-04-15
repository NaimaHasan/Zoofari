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
import 'package:zoofari/View/Screens/EmptyScreen.dart';
import 'package:zoofari/View/Screens/SearchResultsScreen.dart';

import 'Model/Data Definitions/Animal.dart';
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
      ChangeNotifierProvider.value(value: SearchController()),
      ChangeNotifierProvider.value(value: HomeTopRandomAnimal()),
      ChangeNotifierProvider.value(value: CategoricalProvider()),
    ],
    child: MyApp(),
  ));
}

//   hive debug code
//   print("am i even here?");
//   DatabaseManager.addToFavorites( Animal.fromJson('''{"common_name": "dog-tick", "classification": {"Kingdom": "Animalia", "Phylum": "Arthropoda", "Class": "Arachnida", "Order": "Ixodida", "Family": "Ixodidae", "Genus": "Dermacentor", "Scientific Name": "Dermacentor variabilis"}, "general_facts": {"Prey": "Blood", "Name Of Young": "Larvae", "Group Behavior": "Solitary", "Fun Fact": "Dog ticks feed on dogs and other mammals", "Biggest Threat": "Ingestion by mites or nematodes", "Most Distinctive Feature": "Ability to expand greatly in size", "Other Name(s)": "American dog tick, brown dog tick", "Gestation Period": "1-30 days", "Litter Size": "2,000-7,000 eggs", "Diet": "Omnivore", "Type": "Arachnid", "Common Name": "Dog tick", "Number Of Species": "2", "Location": "Everywhere humans live", "Color": ["Brown"], "Skin Type": "Exoskeleton", "Lifespan": "2-3 years", "Length": "2-15 mm", "Age of Sexual Maturity": "30-600 days"}, "image_link": ["https://a-z-animals.com/media/2022/02/Dog-Tick-header-768x401.jpg", "https://a-z-animals.com/media/2022/02/Dog-Tick-on-dog-768x401.jpg", "https://a-z-animals.com/media/2022/02/Dog-Tick-removal-768x401.jpg", "https://a-z-animals.com/media/2022/02/Dog-Tick-on-ear-768x401.jpg", "https://a-z-animals.com/media/2022/02/Dog-Tick-with-eggs-768x401.jpg", "https://a-z-animals.com/media/2022/02/Dog-Tick-isolated-768x401.jpg", "https://a-z-animals.com/media/2022/04/why-do-dogs-throw-up-header-300x180.jpg"], "conservation_status": "Not Listed"}''') );
//   print(DatabaseManager.isFavorite('dog-tick'));
//   Animal sth = LocalDatabase.favoritesBox.get('dog-tick');
//   print(sth.scientificName);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoofari',
      // debugShowCheckedModeBanner: false,
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
        //backgroundColor: const Color(0xFFe9f8f5),
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
            ), // TODO: don't know what to pass
        SearchResultsScreen.routeName: (ctx) =>
            SearchResultsScreen(searchKey: ''),
        EmptyScreen.routeName: (ctx) => EmptyScreen(imageData: ''),
      },
    );
  }
}
