import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

class Mammals with ChangeNotifier {
  List<Animal> _list = List.empty(growable: true);

  List<Animal> get mammalList {
    return _list;
  }

  Future<void> getData() async {
    var animals = await OnlineRepository.fetchCategoricalAnimal("mammals");
    if (animals != null) {
      _list.clear();
      for (final item in animals) {
        if (item is Animal) {
          _list.add(item);
          notifyListeners();
        }
      }
    }
    notifyListeners();
  }
}