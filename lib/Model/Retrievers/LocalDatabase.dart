import '../Data Definitions/Animal.dart';

class LocalDatabase {
  String _path;
  final List<Animal> _favoriteAnimals;

  LocalDatabase(this._path, this._favoriteAnimals);

  List<Animal> get favoriteAnimals => _favoriteAnimals;

  bool addFavoriteAnimal(Animal animal) {
    _favoriteAnimals.add(animal);
    //add to database here
    return true;
  }

  bool removeFavoriteAnimal(Animal animal) {
    _favoriteAnimals.remove(animal);
    //remove from database here
    return true;
  }

  String get path => _path;

  set path(String value) {
    _path = value;
  }
}
