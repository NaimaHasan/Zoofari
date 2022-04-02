import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:zoofari/Model/Data Definitions/Animal.dart';

class OnlineRepository {
  static var random = new Random();
  static var client = http.Client();
  static const String _hostWebsite = "https://a-z-animals-api.herokuapp.com";
  static const String _allAnimalsURL = _hostWebsite + '/animals';

  static String get allAnimalsURL => _allAnimalsURL;
  static String getAnimalTypeURL(String animalType) => _allAnimalsURL + '/$animalType';
  static String getAnimalDetailURL(String animalName) => _allAnimalsURL + '/name=$animalName';

  static String getSearchURL(String searchText) {
    String parsedText = searchText.toLowerCase().replaceAll(' ', '+');
    return _hostWebsite + '/search/$parsedText';
  }

  static List<Animal> returnAnimalList(var list) {
    return list;
  }

  static Future<List<Animal>?> animalListCompilation(List<String> animalsToFetch) async{
    List<Animal?> animalsFetched = List.empty(growable: true);
    for(int itr = 0; itr < animalsToFetch.length; itr++) {
      var fetched = await fetchSingleAnimal( animalsToFetch[itr] );
      animalsFetched.add( fetched );
    }
    return returnAnimalList(animalsFetched);
  }

  static List<String> extractNames(var jsonString, var category) {
    int resultFound = jsonString['found'];
    List<int> positions = List.empty(growable: true);
    for(int itr = 0; itr < 10; itr++) {
      positions.add(random.nextInt(resultFound - 1));
    }
    List<String> toFetch = List.empty(growable: true);
    for(int itr = 0; itr < toFetch.length; itr++) {
      toFetch.add( jsonString[category][ positions[itr] ] );
    }
    return toFetch;
  }

  static List<String> extractSearchResultNames(var jsonString) {
    List<String> toReturn = jsonString['search_result'];
    return toReturn;
  }

  // primary function: gets a single animal
  static Future<Animal?> fetchSingleAnimal(String animalName) async {
    var response = await client.get(Uri.parse( getAnimalDetailURL(animalName) ));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animalFromJson(jsonString);
    }
    return null;
  }

  // primary function: gets a list of animals, here category == animals, mammals, fish, birds, reptiles, amphibians
  static Future<List<Animal>?> fetchCategoricalAnimal(String category) async {
    bool all = false;
    if(category == 'animals') {
      all = true;
    }
    late var response;
    if(all) {
      response = await client.get(Uri.parse( allAnimalsURL ));
    } else {
      response = await client.get(Uri.parse( getAnimalTypeURL(category) ));
    }

    if( response.statusCode == 200 ) {
      var jsonString = response.body;
      List<String> animalsToFetch = extractNames(jsonString, category);
      
      return animalListCompilation(animalsToFetch);
    }
    return null;
  }

  // primary function: gets search result
  static Future<List<Animal>?> fetchSearchedAnimals(String searchText) async {
    var searchURL = getSearchURL(searchText);
    var response = await client.get(Uri.parse( searchURL ));

    if(response.statusCode == 200) {
      var jsonString = (response.body);
      List<String> animalsToFetch = extractSearchResultNames(jsonString);

      return animalListCompilation(animalsToFetch);
    }
    
    return null;
  }

}
