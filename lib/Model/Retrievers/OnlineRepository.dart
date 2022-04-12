import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:zoofari/Model/Data Definitions/Animal.dart';
import 'package:zoofari/Model/Data%20Definitions/Amphibian.dart';

class OnlineRepository {
  static String categoryStr = '';
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
    //print(list);
    return list;
  }

  static Future<List<dynamic>?> animalListCompilation(
      List<String> animalsToFetch) async {
    List<dynamic> animalsFetched = List.empty(growable: true);
    for (int itr = 0; itr < animalsToFetch.length; itr++) {
      var fetched = await fetchSingleAnimal(animalsToFetch[itr]);
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
      positions.add(random.nextInt(resultFound - 1));
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
  static Future<dynamic> fetchSingleAnimal(String animalName) async {
    var response = await client.get(Uri.parse(getAnimalDetailURL(animalName)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      if (categoryStr == 'amphibians')
        return Amphibian.animalFromJson(jsonString);
      return Animal.animalFromJson(jsonString);
    }
    return null;
  }

  // primary function: gets a list of animals, here category == animals, mammals, fish, birds, reptiles, amphibians
  static Future<List<dynamic>?> fetchCategoricalAnimal(String category) async {
    bool all = false;
    categoryStr = category;
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

      return animalListCompilation(animalsToFetch);
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
