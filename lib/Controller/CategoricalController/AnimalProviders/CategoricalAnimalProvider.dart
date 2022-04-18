import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

class CategoricalProvider with ChangeNotifier {
  List<Animal> _list = List.empty(growable: true);
  String callingCategory = "";

  List<Animal> get categoricalList {
    return _list;
  }

  Future<void> getData(String category) async {
    _list.clear();
    CategoricalAnimalFetcher categoricalFetcher = CategoricalAnimalFetcher();
    await categoricalFetcher.getAnimals(category);
    _list.addAll(categoricalFetcher.categoricalAnimalList);
    notifyListeners();
    callingCategory = category;
  }
}
