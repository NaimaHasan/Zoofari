import 'dart:convert';

import 'Animal.dart';

class Bird extends Animal {
  late String _wingspan;
  late String _nestingLocation;

  Bird(rawJsonString,
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
      wingspan,
      nestingLocation})
      : super(rawJsonString) {
    this._wingspan = wingspan != null
        ? wingspan
        : rawJsonString["general_facts"]["Wingspan"] != null
            ? rawJsonString["general_facts"]["Wingspan"]
            : "not available";
    this._nestingLocation = nestingLocation != null
        ? nestingLocation
        : rawJsonString["general_facts"]["Nesting Location"] != null
            ? rawJsonString["general_facts"]["Nesting Location"]
            : "not available";
  }

  String get wingspan => _wingspan;

  set wingspan(String value) {
    _wingspan = value;
  }

  String get nestingLocation => _nestingLocation;

  set nestingLocation(String value) {
    _nestingLocation = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({'Wingspan': _wingspan, 'NestingLocation': _nestingLocation});
    return info;
  }

  factory Bird.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);
    Animal animal = Animal.fromJson(jsonParam);

    String wingspanVar = "Not Available";
    String nestingLocationVar = "Not Available";

    if (jsonParam["general_facts"]["Wingspan"] != null) {
      wingspanVar = jsonParam["general_facts"]["Wingspan"];
    }
    if (jsonParam["general_facts"]["Nesting Location"] != null) {
      nestingLocationVar = jsonParam["general_facts"]["Nesting Location"];
    }

    return Bird(jsonParam,
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
        diets: animal.diets,
        habitats: animal.habitats,
        preys: animal.preys,
        predators: animal.predators,
        colors: animal.colors,
        imageLinks: animal.imageLinks,
        wingspan: wingspanVar,
        nestingLocation: nestingLocationVar);
  }

  factory Bird.emptyAnimal() {
    Animal animal = Animal.emptyAnimal();

    String wingspanVar = "Not Available";
    String nestingLocationVar = "Not Available";

    return Bird("",
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
        diets: animal.diets,
        habitats: animal.habitats,
        preys: animal.preys,
        predators: animal.predators,
        colors: animal.colors,
        imageLinks: animal.imageLinks,
        wingspan: wingspanVar,
        nestingLocation: nestingLocationVar);
  }
  static Bird animalFromJson(String str) {
    return Bird.fromJson(json.decode(str));
  }
}
