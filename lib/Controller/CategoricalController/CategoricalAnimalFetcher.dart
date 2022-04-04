import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Controller/SearchController/ResultParser.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

class CategoricalAnimalFetcher {
  static List<Animal> categoricalAnimalList = List.empty(growable: true);
  static String previousCategory = "";

  static Future<void> getAnimals(String category) async {
    if(previousCategory == "") {
      previousCategory = category;
    }
    if(previousCategory != category) {
      categoricalAnimalList = List.empty(growable: true);
    }
    var animals = await OnlineRepository.fetchCategoricalAnimal(category);
    if(animals != null) {
      for(final item in animals) {
        if(item is Animal) {
          categoricalAnimalList.add(item);
        }
      }
    }
    previousCategory = category;
  }
}
