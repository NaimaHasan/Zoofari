import 'dart:convert';

import 'Animal.dart';

class Mammal extends Animal {
  late String _ageOfWeaning;
  late String _avgLitterSz;
  late String _ageOfSexualMaturity;

  Mammal(rawJsonString,
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
      ageOfWeaning,
      avgLitterSz,
      ageOfSexualMaturity})
      : super(rawJsonString) {
    this._ageOfWeaning = ageOfWeaning != null
        ? ageOfWeaning
        : rawJsonString["general_facts"]["Age Of Weaning"] != null
            ? rawJsonString["general_facts"]["Age Of Weaning"]
            : "Not Available";
    this._avgLitterSz = avgLitterSz != null
        ? avgLitterSz
        : rawJsonString["general_facts"]["Average Litter Size"] != null
            ? rawJsonString["general_facts"]["Average Litter Size"]
            : "Not Available";
    this._ageOfSexualMaturity = ageOfSexualMaturity != null
        ? ageOfSexualMaturity
        : rawJsonString["general_facts"]["Age Of Sexual Maturity"] != null
            ? rawJsonString["general_facts"]["Age Of Sexual Maturity"]
            : "Not Available";
  }

  String get ageOfWeaning => _ageOfWeaning;

  set ageOfWeaning(String value) {
    _ageOfWeaning = value;
  }

  String get avgLitterSz => _avgLitterSz;

  set avgLitterSz(String value) {
    _avgLitterSz = value;
  }

  String get ageOfSexualMaturity => _ageOfSexualMaturity;

  set ageOfSexualMaturity(String value) {
    _ageOfSexualMaturity = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({
      'AgeOfSexualMaturity': _ageOfSexualMaturity,
      'AgeOfWeaning': _ageOfWeaning,
      'AvgLitterSz': _avgLitterSz
    });
    return info;
  }

  factory Mammal.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);
    Animal animal = Animal.fromJson(jsonParam);

    String ageOfWeaningVar = "Not Available";
    String ageOfSexualMaturityVar = "Not Available";
    String avgLitterSzVar = "Not Available";

    if (jsonParam["general_facts"]["Age Of Weaning"] != null) {
      ageOfWeaningVar = jsonParam["general_facts"]["Age Of Weaning"];
    }
    if (jsonParam["general_facts"]["Age Of Sexual Maturity"] != null) {
      ageOfSexualMaturityVar =
          jsonParam["general_facts"]["Age Of Sexual Maturity"];
    }
    if (jsonParam["general_facts"]["Average Litter Size"] != null) {
      avgLitterSzVar = jsonParam["general_facts"]["Average Litter Size"];
    }

    return Mammal(jsonParam,
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
        avgLitterSz: avgLitterSzVar,
        ageOfWeaning: ageOfWeaningVar,
        ageOfSexualMaturity: ageOfSexualMaturityVar);
  }

  factory Mammal.emptyAnimal() {
    Animal animal = Animal.emptyAnimal();

    String ageOfWeaningVar = "Not Available";
    String ageOfSexualMaturityVar = "Not Available";
    String avgLitterSzVar = "Not Available";

    return Mammal("",
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
        avgLitterSz: avgLitterSzVar,
        ageOfWeaning: ageOfWeaningVar,
        ageOfSexualMaturity: ageOfSexualMaturityVar);
  }
  static Mammal animalFromJson(String str) {
    return Mammal.fromJson(json.decode(str));
  }
}
