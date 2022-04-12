import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

class Reptiles with ChangeNotifier {
  List<Animal> _list = List.empty(growable: true);

  List<Animal> get reptileList {
    return _list;
  }

  Future<void> getData() async {
    _list.clear();
    CategoricalAnimalFetcher reptileFetcher = CategoricalAnimalFetcher(1);
    await reptileFetcher.getAnimals("reptiles");
    _list = reptileFetcher.categoricalAnimalList;
    notifyListeners();
  }
}