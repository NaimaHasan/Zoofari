import 'package:hive_flutter/hive_flutter.dart';

import '../Data Definitions/Animal.dart';

///Class containing the basic structure of information to be stored in the local database
class LocalDatabase {
  static List<Animal> _favoriteAnimals = List.empty(growable: true);
  static const String DB_BOX_NAME = "Favorites";
  static late Box favoritesBox;
  static late Stream favoritesStream;

  LocalDatabase();

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AnimalAdapter());
    favoritesBox = await Hive.openBox(DB_BOX_NAME);
    favoritesStream = favoritesBox.watch();
  }

  static List<Animal> get favoriteAnimals {
    List<dynamic> tempList = favoritesBox.values.toList(growable: true);
    if (_favoriteAnimals.isNotEmpty) {
      _favoriteAnimals.clear();
    }
    for (var item in tempList) {
      _favoriteAnimals.add(item);
    }

    return _favoriteAnimals;
  }

  static Future addFavoriteAnimal(Animal animal) async {
    //add to database here
    await favoritesBox.put(animal.commonName, animal);
  }

  static Future removeFavoriteAnimal(Animal animal) async {
    //remove from database here
    await favoritesBox.delete(animal.commonName);
    // return true;
  }

  static bool isFavoriteAnimal(Animal animal) {
    if (favoritesBox.get(animal.commonName) != null) {
      return true;
    }
    return false;
  }

  static bool isFavorite(String commonName) {
    if (favoritesBox.get(commonName) != null) {
      return true;
    }
    return false;
  }

  static Animal getParticularAnimal(String commonName) {
    return favoritesBox.get(commonName);
  }
}
