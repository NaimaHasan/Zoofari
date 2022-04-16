import '../../../Model/Data Definitions/Animal.dart';
import '../../../Model/Data Definitions/EndangeredAnimal.dart';

class DummyAnimalList {
  static List<Animal> animalList = List.empty(growable: true);

  DummyAnimalList() {
    Animal dummy = Animal.emptyAnimal();

    for (int itr = 0; itr < 10; itr++) {
      animalList.add(dummy);
    }
  }
}

class DummyEndangeredAnimalList {
  static List<EndangeredAnimal> animalList = List.empty(growable: true);

  DummyEndangeredAnimalList() {
    EndangeredAnimal dummy = EndangeredAnimal.emptyAnimal();

    for (int itr = 0; itr < 10; itr++) {
      animalList.add(dummy);
    }
  }
}
