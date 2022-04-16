import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';
import 'package:zoofari/View/Auxiliary/Helpers/DummyAnimalList.dart';

class CategoricalAnimalFetcher  {
  List<Animal> categoricalAnimalList = DummyAnimalList.animalList;
  late int k;

  CategoricalAnimalFetcher(int a) {
    this.k = a;
  }
  

  Future<void> getAnimals(String category) async {
    print("---------------fetching $category");
    var animals = await OnlineRepository.fetchCategoricalAnimal(category);
    if (animals != null) {
      categoricalAnimalList.clear();
      for (final item in animals) {
        if (item is Animal) {
          categoricalAnimalList.add(item);
        }
      }
    }
    // previousCategory = category;
    // notifyListeners();
  }
}
