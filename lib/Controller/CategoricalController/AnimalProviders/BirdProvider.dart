import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

class Bird with ChangeNotifier {
  List<Animal> _list = List.empty(growable: true);

  List<Animal> get birdList {
    return _list;
  }

  Future<void> getData() async {
    _list.clear();
    CategoricalAnimalFetcher birdFetcher = CategoricalAnimalFetcher(1);
    await birdFetcher.getAnimals("birds");
    _list = birdFetcher.categoricalAnimalList;
    notifyListeners();
  }
}