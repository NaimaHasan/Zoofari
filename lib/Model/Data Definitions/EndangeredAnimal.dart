import 'dart:convert';

import 'Animal.dart';

class EndangeredAnimal extends Animal {
  late String _endangeredStatus;

  EndangeredAnimal(rawJsonString,
      {commonName,
      scientificName,
      kingdom,
      phylum,
      order,
      family,
      genus,
      avgWeight,
      maxWeight,
      maxLength,
      maxSpeed,
      lifespan,
      lifestyle,
      classType,
      skinType,
      funFact,
      diets,
      habitats,
      preys,
      predators,
      colors,
      imageLinks,
      endangeredStatus})
      : super(rawJsonString) {
    this._endangeredStatus = endangeredStatus != null
        ? endangeredStatus
        : rawJsonString["conservation_status"] != null
            ? rawJsonString["conservation_status"]
            : "Not Available";
  }

  String get endangeredStatus => _endangeredStatus;

  set endangeredStatus(String value) {
    _endangeredStatus = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({'Endangered Status': _endangeredStatus});
    return info;
  }

  // factory EndangeredAnimal.fromAnimalString(Animal animal, String enStatus) {
  //   return EndangeredAnimal(
  //     animal.commonName,
  //     animal.scientificName,
  //     animal.kingdom,
  //     animal.phylum,
  //     animal.order,
  //     animal.family,
  //     animal.genus,
  //     animal.avgWeight,
  //     animal.maxWeight,
  //     animal.maxLength,
  //     animal.maxSpeed,
  //     animal.lifespan,
  //     animal.lifestyle,
  //     animal.classType,
  //     animal.skinType,
  //     animal.funFact,
  //     animal.diets,
  //     animal.habitats,
  //     animal.preys,
  //     animal.predators,
  //     animal.colors,
  //     animal.imageLinks,
  //     enStatus);
  // }

  factory EndangeredAnimal.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);
    Animal animal = Animal.fromJson(jsonParam);

    String endangeredStatusVar = "Not Available";

    if (jsonParam["conservation_status"] != null) {
      endangeredStatusVar = jsonParam["conservation_status"];
    }

    return EndangeredAnimal(jsonParam,
        commonName: animal.commonName,
        scientificName: animal.scientificName,
        kingdom: animal.kingdom,
        phylum: animal.phylum,
        classType: animal.classType,
        order: animal.order,
        family: animal.family,
        genus: animal.genus,
        avgWeight: animal.avgWeight,
        maxWeight: animal.maxWeight,
        maxLength: animal.maxLength,
        maxSpeed: animal.maxSpeed,
        lifespan: animal.lifespan,
        lifestyle: animal.lifestyle,
        skinType: animal.skinType,
        funFact: animal.funFact,
        diets: animal.diet,
        habitats: animal.habitats,
        preys: animal.preys,
        predators: animal.predators,
        colors: animal.colors,
        imageLinks: animal.imageLinks,
        endangeredStatus: endangeredStatusVar);
  }

  factory EndangeredAnimal.emptyAnimal() {
    Animal animal = Animal.emptyAnimal();

    String endangeredStatusVar = "Not Available";

    return EndangeredAnimal("",
        commonName: animal.commonName,
        scientificName: animal.scientificName,
        kingdom: animal.kingdom,
        phylum: animal.phylum,
        classType: animal.classType,
        order: animal.order,
        family: animal.family,
        genus: animal.genus,
        avgWeight: animal.avgWeight,
        maxWeight: animal.maxWeight,
        maxLength: animal.maxLength,
        maxSpeed: animal.maxSpeed,
        lifespan: animal.lifespan,
        lifestyle: animal.lifestyle,
        skinType: animal.skinType,
        funFact: animal.funFact,
        diets: animal.diet,
        habitats: animal.habitats,
        preys: animal.preys,
        predators: animal.predators,
        colors: animal.colors,
        imageLinks: animal.imageLinks,
        endangeredStatus: endangeredStatusVar);
  }
  static EndangeredAnimal animalFromJson(String str) {
    return EndangeredAnimal.fromJson(json.decode(str));
  }
}
