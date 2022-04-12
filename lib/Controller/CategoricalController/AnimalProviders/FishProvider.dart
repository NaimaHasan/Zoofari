import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

class Fish with ChangeNotifier {
  List<Animal> _list = List.empty(growable: true);

  List<Animal> get fishList {
    return _list;
  }

  Future<void> getData() async {
    _list.clear();
    CategoricalAnimalFetcher fishFetcher = CategoricalAnimalFetcher(1);
    await fishFetcher.getAnimals("fish");
    _list = fishFetcher.categoricalAnimalList;
    notifyListeners();
  }
}