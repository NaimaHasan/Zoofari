

import 'package:flutter/cupertino.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import '../../../Model/Data Definitions/Animal.dart';

class FavoritesProvider with ChangeNotifier {
  List<Animal> _favorites = List.empty(growable: true);
  bool isFave = false;

  List<Animal> get allFavorites => _favorites;

  Future<void> getAllFavorites() async{
    _favorites.clear();
    _favorites = DatabaseManager.getAllFavorites();
    notifyListeners();
  }

  Future<void> isFaveAnimal(Animal toCheck) async{
    isFave = DatabaseManager.isFavoriteAnimal(toCheck);
    notifyListeners();
  }
}