import 'package:hive_flutter/hive_flutter.dart';
import '../Data Definitions/Animal.dart';


class LocalDatabase {
  // String _path;
  static List<Animal> _favoriteAnimals = List.empty(growable: true);
  static const String DB_BOX_NAME = "Favorites";
  static late Box favoritesBox;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AnimalAdapter());
    favoritesBox = await Hive.openBox(DB_BOX_NAME);
  } 

  // LocalDatabase(this._path, this._favoriteAnimals);

  static List<Animal> get favoriteAnimals {
    List<dynamic> tempList = favoritesBox.values.toList(growable: true);
    for(var item in tempList) {
      Animal animal = item;
      _favoriteAnimals.add(animal);
    }
    return _favoriteAnimals;
  } 

  static Future addFavoriteAnimal(Animal animal) async{
    // _favoriteAnimals.add(animal);
    //add to database here
    await favoritesBox.put(animal.commonName, animal);
  }

  static Future removeFavoriteAnimal(Animal animal) async{
    // _favoriteAnimals.remove(animal);
    //remove from database here
    await favoritesBox.delete(animal.commonName);
    // return true;
  }

  static bool isFavoriteAnimal(Animal animal) {
    if(favoritesBox.get(animal.commonName) != null) {
      return true;
    }
    return false;
  }

  static bool isFavorite(String commonName) {
    if(favoritesBox.get(commonName) != null) {
      return true;
    }
    return false;
  }

  static Animal getParticularAnimal(String commonName) {
    return favoritesBox.get(commonName);
  }
  // String get path => _path;

  // set path(String value) {
  //   _path = value;
  // }
}
