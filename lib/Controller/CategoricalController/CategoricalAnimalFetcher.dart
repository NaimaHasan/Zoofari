import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Controller/SearchController/ResultParser.dart';

class CategoricalAnimalFetcher {
  static List<Animal> getAnimals(String category) {
    String jsonString = DatabaseManager.getAnimals(category);
    List<Animal> animals = ResultParser.parseAnimals(jsonString);
    return animals;
  }
}
