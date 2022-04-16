import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Model/Data%20Definitions/Amphibian.dart';
import 'package:zoofari/Model/Data%20Definitions/Bird.dart';
import 'package:zoofari/Model/Data%20Definitions/EndangeredAnimal.dart';
import 'package:zoofari/Model/Data%20Definitions/Fish.dart';
import 'package:zoofari/Model/Data%20Definitions/Mammal.dart';
import 'package:zoofari/Model/Data%20Definitions/Reptile.dart';

class OnlineRepository {
  static var random = new Random();
  static var client = http.Client();
  static const String _hostWebsite = "https://a-z-animals-api.herokuapp.com";
  // static const String _hostWebsite = "https://animalsaroundus.pythonanywhere.com";
  static const String _allAnimalsURL = _hostWebsite + '/animals';

  static String get allAnimalsURL => _allAnimalsURL;
  static String getAnimalTypeURL(String animalType) =>
      _allAnimalsURL + '/$animalType';
  static String getAnimalDetailURL(String animalName) =>
      _allAnimalsURL + '/name=$animalName';

  static String getSearchURL(String searchText) {
    //String parsedText = searchText.toLowerCase().replaceAll(' ', '+');
    return _hostWebsite + '/search/$searchText';
  }

  static List<dynamic> returnAnimalList(var list) {
    return list;
  }

  static Future<List<dynamic>?> animalListCompilation(
      List<String> animalsToFetch, String category) async {
    List<dynamic> animalsFetched = List.empty(growable: true);
    for (int itr = 0; itr < animalsToFetch.length; itr++) {
      var fetched = await fetchSingleAnimal(animalsToFetch[itr], category);
      //print("fetched in animal list compilation $fetched");
      if (fetched != null) {
        animalsFetched.add(fetched);
      }
    }
    return returnAnimalList(animalsFetched);
  }

  static List<String> extractNames(var jsonString, var category) {
    int resultFound = jsonString['found'];
    // print("result found $resultFound");
    List<int> positions = List.empty(growable: true);
    for (int itr = 0; itr < 5; itr++) {
      int newAdd = random.nextInt(resultFound - 1);
      if(! ( positions.contains(newAdd) ) ) 
        positions.add(random.nextInt(resultFound - 1));
      else itr--;
    }
    List<String> toFetch = List.empty(growable: true);
    // print(jsonString);
    for (int itr = 0; itr < positions.length; itr++) {
      // print(jsonString[category][positions[itr]]);
      toFetch.add(jsonString[category][positions[itr]]);
    }
    //print("to fetch list in extract names $toFetch");
    return toFetch;
  }

  static List<String> extractSearchResultNames(var jsonString) {
    // print(jsonString);
    jsonString = json.decode(jsonString);
    List<dynamic> resultList = jsonString['search_result'];
    List<String> toReturn = List.empty(growable: true);

    for (int itr = 0; itr < resultList.length; itr++) {
      toReturn.add(resultList[itr]);
    }

    return toReturn;
  }

  // primary function: gets a single animal
  static Future<dynamic> fetchSingleAnimal(String animalName,
      [String category = 'animals']) async {
    var response = await client.get(Uri.parse(getAnimalDetailURL(animalName)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      if (category == 'amphibians')
        return Amphibian.animalFromJson(jsonString);
      else if (category == 'birds')
        return Bird.animalFromJson(jsonString);
      else if (category == 'fish')
        return Fish.animalFromJson(jsonString);
      else if (category == 'mammals')
        return Mammal.animalFromJson(jsonString);
      else if (category == 'reptiles')
        return Reptile.animalFromJson(jsonString);
      else if (category == 'endangered')
        return EndangeredAnimal.animalFromJson(jsonString);
      else if (category == 'animals') return Animal.animalFromJson(jsonString);
    }
    return null;
  }

  // primary function: gets a list of animals, here category == animals, mammals, fish, birds, reptiles, amphibians
  static Future<List<dynamic>?> fetchCategoricalAnimal(String category) async {
    bool all = false;
    if (category == 'animals') {
      all = true;
    }
    late var response;
    if (all) {
      response = await client.get(Uri.parse(allAnimalsURL));
    } else {
      response = await client.get(Uri.parse(getAnimalTypeURL(category)));
    }

    List<String> animalsToFetch = List.empty(growable: true);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      if (category == 'endangered') {
        animalsToFetch = extractEnNames(json.decode(jsonString));
      } else {
        animalsToFetch = extractNames(json.decode(jsonString), category);
      }

      return animalListCompilation(animalsToFetch, category);
    }
    return null;
  }

  // primary function: gets search result
  static Future<List<String?>?> fetchSearchedAnimalNames(
      String searchText) async {
    var searchURL = getSearchURL(searchText);
    var response = await client.get(Uri.parse(searchURL));

    if (response.statusCode == 200) {
      var jsonString = (response.body);
      List<String> animalsToFetch = extractSearchResultNames(jsonString);

      return animalsToFetch;
    }

    return null;
  }

  static List<String> extractEnNames(var jsonString) {
    List<dynamic> ex = jsonString['ex'];
    List<dynamic> ew = jsonString['ew'];
    List<dynamic> en = jsonString['en'];
    List<dynamic> cr = jsonString['cr'];
    List<dynamic> vu = jsonString['vu'];

    List<String> animalToFetch = List.empty(growable: true);
    animalToFetch.add(ex[random.nextInt(ex.length - 1)]);
    animalToFetch.add(ew[random.nextInt(ew.length - 1)]);
    animalToFetch.add(en[random.nextInt(en.length - 1)]);
    animalToFetch.add(cr[random.nextInt(cr.length - 1)]);
    animalToFetch.add(vu[random.nextInt(vu.length - 1)]);
    return animalToFetch;
  }
}
