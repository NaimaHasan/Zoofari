
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

import '../../../Model/Data Definitions/Animal.dart';

class HomeTopRandomAnimal with ChangeNotifier {
  Animal _animal = Animal.emptyAnimal();
  Random random = Random();

  Animal get homeTopRandomAnimal => _animal;
  
  Future<void> getData() async {
    var allAnimalList = await OnlineRepository.fetchCategoricalAnimal("animals");

    if(allAnimalList != null) {
      int listLen = allAnimalList.length;
      int chosen = random.nextInt(listLen - 1);

      var fetched = await OnlineRepository.fetchSingleAnimal(allAnimalList[chosen]?.commonName);
      
      if(fetched != null) {
        _animal = fetched;
        notifyListeners();
      }
    }

    notifyListeners();
  }
}