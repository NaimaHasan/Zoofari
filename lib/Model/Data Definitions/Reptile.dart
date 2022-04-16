import 'dart:convert';

import 'Animal.dart';

class Reptile extends Animal {
  late String _gestationPeriod;

  Reptile(rawJsonString,
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
      gestationPeriod})
      : super(rawJsonString) {
    this._gestationPeriod = gestationPeriod != null
        ? gestationPeriod
        : rawJsonString["general_facts"]["Gestation Period"] != null
            ? rawJsonString["general_facts"]["Gestation Period"]
            : "Not Available";
  }

  String get gestationPeriod => _gestationPeriod;

  set gestationPeriod(String value) {
    _gestationPeriod = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({'GestationPeriod': _gestationPeriod});
    return info;
  }

  factory Reptile.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);
    Animal animal = Animal.fromJson(jsonParam);

    String gestationPeriodVar = "Not Available";

    if (jsonParam["general_facts"]["Gestation Period"] != null) {
      gestationPeriodVar = jsonParam["general_facts"]["Gestation Period"];
    }

    return Reptile(jsonParam,
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
        gestationPeriod: gestationPeriodVar);
  }

  factory Reptile.emptyAnimal() {
    Animal animal = Animal.emptyAnimal();

    String gestationPeriodVar = "Not Available";

    return Reptile("",
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
        gestationPeriod: gestationPeriodVar);
  }
  static Reptile animalFromJson(String str) {
    return Reptile.fromJson(json.decode(str));
  }
}
