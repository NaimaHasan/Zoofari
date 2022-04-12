import '../../../Model/Data Definitions/Animal.dart';

class DummyAnimalList {
  static List<Animal> animalList = List.empty(growable: true);
  
  DummyAnimalList() {
    Animal dummy = Animal.emptyAnimal();

    for(int itr = 0; itr < 10; itr++) {
      animalList.add(dummy);
    }
  }
}