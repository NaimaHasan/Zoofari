import '../../../Model/Data Definitions/Animal.dart';
import '../../../Model/Data Definitions/EndangeredAnimal.dart';

///Helper class for generating a dummy animal list
class DummyAnimalList {

  ///Variable for the dummy animal list
  static List<Animal> animalList = List.empty(growable: true);

  DummyAnimalList() {
    Animal dummy = Animal.emptyAnimal();

    for (int itr = 0; itr < 10; itr++) {
      animalList.add(dummy);
    }
  }
}

///Helper class for generating the dummy endangered list
class DummyEndangeredAnimalList {

  ///Variable for the dummy endangered list
  static List<EndangeredAnimal> animalList = List.empty(growable: true);

  DummyEndangeredAnimalList() {
    EndangeredAnimal dummy = EndangeredAnimal.emptyAnimal();

    for (int itr = 0; itr < 10; itr++) {
      animalList.add(dummy);
    }
  }
}
