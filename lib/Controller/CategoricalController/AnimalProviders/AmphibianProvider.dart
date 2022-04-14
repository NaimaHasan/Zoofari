import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

import '../../../Model/Data Definitions/Amphibian.dart';

class Amphibians with ChangeNotifier {
  List<Animal> _list = List.empty(growable: true);

  List<Animal> get amphibianList {
    return _list;
  }

  Future<void> getData() async {
    _list.clear();
    CategoricalAnimalFetcher amphibianFetcher = CategoricalAnimalFetcher(1);
    await amphibianFetcher.getAnimals("amphibians");
    for(final item in amphibianFetcher.categoricalAnimalList) {
      if(item is Amphibian) {
        _list.add(item);
        notifyListeners();
      }
    }
    notifyListeners();
  }
}