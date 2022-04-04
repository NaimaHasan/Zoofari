import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/LocalDatabase.dart';

class DatabaseManager {
  // static final LocalDatabase _localDatabase = LocalDatabase("", []);
  static final OnlineRepository _remoteDatabase = OnlineRepository();

  OnlineRepository get remoteDatabase => _remoteDatabase;

  static Future<void> initialize() async{
    await LocalDatabase.initialize();
  }

  static Animal getParticularAnimal(String commonName) {
    return LocalDatabase.favoritesBox.get(commonName);
  }

  static List<Animal> getAllFavorites() {
    return LocalDatabase.favoriteAnimals;
  }

  static String getAnimals(String category) {
    // return _remoteDatabase.getAnimals(category);
    return 'dummy string for now';
  }

  // static List<Animal> getFavoriteAnimals(String category) {
  //   return _localDatabase.favoriteAnimals;
  // }

  static Future addToFavorites(Animal animal) async{
    await LocalDatabase.addFavoriteAnimal(animal);
  }

  static Future removeFromFavorites(Animal animal) async{
    await LocalDatabase.removeFavoriteAnimal(animal);
  }

  // static bool removeFromFavorites(Animal animal) {
  //   return _localDatabase.removeFavoriteAnimal(animal);
  // }

  static String getSearchedAnimals(String query) {
    // return _remoteDatabase.getSearchedAnimals(query);
    return "dummy string for now";
  }
}
