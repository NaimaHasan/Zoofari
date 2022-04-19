import 'package:flutter/cupertino.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/Model/Retrievers/OnlineRepository.dart';

///Class containing the provider for the search result
class SearchController with ChangeNotifier {
  List<Animal> _searchResults = List.empty(growable: true);
  
  List<Animal> get searchedAnimals => _searchResults;

  Future<void> getSearchResults(String searchText) async {
    _searchResults.clear();
    dynamic toFetch = await OnlineRepository.fetchSearchedAnimalNames(searchText);
    print("animals to fetch in search result provider");
    List<String> animalsToFetch = toFetch;
    
    for(dynamic name in animalsToFetch) {
      dynamic animal = await OnlineRepository.fetchSingleAnimal(name);
      print(animal.toString());
      _searchResults.add( animal );
      notifyListeners();
    }
  }
}