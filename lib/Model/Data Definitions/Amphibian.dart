import 'dart:convert';

import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

// TODO: fix this
import 'Animal.dart';

// static Amphibian animalFromJson(String jsonString) {
//   return Amphibian.fromJson(json.decode(jsonString));
// }

class Amphibian extends Animal {
  late String _avgSpawnSz;
  late String _waterType;
  late String _incubationPeriod;

  Amphibian(rawJsonString,
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
      avgSpawnSz,
      waterType,
      incubationPeriod})
      : super(rawJsonString) {
    this._avgSpawnSz = avgSpawnSz != null
        ? avgSpawnSz
        : rawJsonString["general_facts"]["Average Spawn Size"] != null
            ? rawJsonString["general_facts"]["Average Spawn Size"]
            : "not available";
    this._incubationPeriod = incubationPeriod != null
        ? incubationPeriod
        : rawJsonString["general_facts"]["Incubation Period"] != null
            ? rawJsonString["general_facts"]["Incubation Period"]
            : "not available";
    this._waterType = waterType != null
        ? waterType
        : rawJsonString["general_facts"]["Water Type"] != null
            ? rawJsonString["general_facts"]["Water Type"]
            : "not available";
  }

  String get avgSpawnSz => _avgSpawnSz;

  set avgSpawnSz(String value) {
    _avgSpawnSz = value;
  }

  String get waterType => _waterType;

  set waterType(String value) {
    _waterType = value;
  }

  String get incubationPeriod => _incubationPeriod;

  set incubationPeriod(String value) {
    _incubationPeriod = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({
      'Average Spawn Size': _avgSpawnSz,
      'Incubation Period': _incubationPeriod,
      'Water Type': _waterType
    });
    return info;
  }

  factory Amphibian.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);
    Animal animal = Animal.fromJson(jsonParam);

    String incubationPeriodVar = "Not Available";
    String waterTypeVar = "Not Available";
    String avgSpawnSzVar = "Not Available";

    if (jsonParam["general_facts"]["Average Spawn Size"] != null) {
      avgSpawnSzVar = jsonParam["general_facts"]["Average Spawn Size"];
    }
    if (jsonParam["general_facts"]["Incubation Period"] != null) {
      incubationPeriodVar = jsonParam["general_facts"]["Incubation Period"];
    }
    if (jsonParam["general_facts"]["Water Type"] != null) {
      waterTypeVar = jsonParam["general_facts"]["Water Type"];
    }

    return Amphibian(jsonParam,
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
        avgSpawnSz: avgSpawnSzVar,
        incubationPeriod: incubationPeriodVar,
        waterType: waterTypeVar);
  }

  factory Amphibian.emptyAnimal() {
    Animal animal = Animal.emptyAnimal();
    String avgSpawnSzVar = "Not Available";
    String incubationPeriodVar = "Not Available";
    String waterTypeVar = "Not Available";

    return Amphibian("",
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
        avgSpawnSz: avgSpawnSzVar,
        incubationPeriod: incubationPeriodVar,
        waterType: waterTypeVar);
  }
  static Amphibian animalFromJson(String str) {
    return Amphibian.fromJson(json.decode(str));
  }
}
