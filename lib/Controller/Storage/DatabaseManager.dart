import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/LocalDatabase.dart';

class DatabaseManager {
  static final LocalDatabase _localDatabase = LocalDatabase("", []);
  static final OnlineRepository _remoteDatabase = OnlineRepository();

  OnlineRepository get remoteDatabase => _remoteDatabase;

  static String getAnimals(String category) {
    // return _remoteDatabase.getAnimals(category);
    return 'dummy string for now';
  }

  static List<Animal> getFavoriteAnimals(String category) {
    return _localDatabase.favoriteAnimals;
  }

  static bool addToFavorites(Animal animal) {
    return _localDatabase.addFavoriteAnimal(animal);
  }

  static bool removeFromFavorites(Animal animal) {
    return _localDatabase.removeFavoriteAnimal(animal);
  }

  static String getSearchedAnimals(String query) {
    // return _remoteDatabase.getSearchedAnimals(query);
    return "dummy string for now";
  }
}
