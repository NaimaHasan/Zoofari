import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'QueryConstructor.dart';

class ResultParser {
  static List<String> keywords = [];

  static List<Animal> parseAnimals(String jsonString) {
    List<Animal> animals = [];
    //do something
    //Map<String, dynamic> animal = jsonDecode(jsonString);
    //animals.add(animal);
    return animals;
  }

  static List<Animal> getSearchedAnimals(String searchKeyword) {
    String query = QueryConstructor.constructQuery(searchKeyword);
    String jsonString = DatabaseManager.getSearchedAnimals(query);
    List<Animal> animals = ResultParser.parseAnimals(jsonString);
    return animals;
  }
}
