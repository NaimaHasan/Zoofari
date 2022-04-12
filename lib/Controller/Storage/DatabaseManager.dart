import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/LocalDatabase.dart';

class DatabaseManager {
  static Future<void> initialize() async {
    await LocalDatabase.initialize();
  }

  // static Future<List<Animal?>?> getSearchedAnimals(String searchKey) async {
  //   return await OnlineRepository.fetchSearchedAnimals(
  //       QueryConstructor.constructSearchKeyWord(searchKey));
  // }

  static Animal getParticularFavoriteAnimal(String commonName) {
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

  static Future addToFavorites(Animal animal) async {
    await LocalDatabase.addFavoriteAnimal(animal);
  }

  static Future removeFromFavorites(Animal animal) async {
    await LocalDatabase.removeFavoriteAnimal(animal);
  }
}
