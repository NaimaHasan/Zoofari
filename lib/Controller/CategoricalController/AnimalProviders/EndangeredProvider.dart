import 'package:flutter/material.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';
import 'package:zoofari/View/Auxiliary/Helpers/DummyAnimalList.dart';

class Endangered with ChangeNotifier {
  List<Animal> _list = DummyAnimalList.animalList;

  List<Animal> get endangeredList {
    return _list;
  }

  Future<void> getData() async {
    var animals = await OnlineRepository.fetchCategoricalAnimal("endangered");
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