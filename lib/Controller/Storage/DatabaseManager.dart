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
    return LocalDatabase.getParticularAnimal(commonName);
  }

  static bool isFavoriteAnimal(Animal animal) {
    return LocalDatabase.isFavoriteAnimal(animal);
  }

  static bool isFavorite(String commonName) {
    return LocalDatabase.isFavorite(commonName);
  }

  static List<Animal> getAllFavorites() {
    return LocalDatabase.favoriteAnimals;
  }

  static Future addToFavorites(Animal animal) async{
    await LocalDatabase.addFavoriteAnimal(animal);
  }

  static Future removeFromFavorites(Animal animal) async{
    await LocalDatabase.removeFavoriteAnimal(animal);
  }
}
