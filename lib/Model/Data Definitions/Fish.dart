import 'dart:convert';

import 'Animal.dart';

class Fish extends Animal {
  late String _groupBehavior;
  late String _estimatedPopulationSz;

  Fish(rawJsonString,
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
      groupBehavior,
      estimatedPopulationSz})
      : super(rawJsonString) {
    this._groupBehavior = groupBehavior != null
        ? groupBehavior
        : rawJsonString["general_facts"]["Group Behavior"] != null
            ? rawJsonString["general_facts"]["Group Behavior"]
            : "Not Available";
    this._estimatedPopulationSz = estimatedPopulationSz != null
        ? estimatedPopulationSz
        : rawJsonString["general_facts"]["Estimated Population Size"] != null
            ? rawJsonString["general_facts"]["Estimated Population Size"]
            : "Not Available";
  }
  String get groupBehavior => _groupBehavior;

  set groupBehavior(String value) {
    _groupBehavior = value;
  }

  String get estimatedPopulationSz => _estimatedPopulationSz;

  set estimatedPopulationSz(String value) {
    _estimatedPopulationSz = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({
      'GroupBehavior': _groupBehavior,
      'EstimatedPopulationSz': _estimatedPopulationSz
    });
    return info;
  }

  factory Fish.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);
    Animal animal = Animal.fromJson(jsonParam);

    String groupBehaviorVar = "Not Available";
    String estimatedPopulationSzVar = "Not Available";

    if (jsonParam["general_facts"]["Group Behavior"] != null) {
      groupBehaviorVar = jsonParam["general_facts"]["Group Behavior"];
    }
    if (jsonParam["general_facts"]["Estimated Population Size"] != null) {
      estimatedPopulationSzVar =
          jsonParam["general_facts"]["Estimated Population Size"];
    }

    return Fish(jsonParam,
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
        groupBehavior: groupBehaviorVar,
        estimatedPopulationSz: estimatedPopulationSzVar);
  }

  factory Fish.emptyAnimal() {
    Animal animal = Animal.emptyAnimal();

    String groupBehaviorVar = "Not Available";
    String estimatedPopulationSzVar = "Not Available";

    return Fish("",
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
        groupBehavior: groupBehaviorVar,
        estimatedPopulationSz: estimatedPopulationSzVar);
  }
  static Fish animalFromJson(String str) {
    return Fish.fromJson(json.decode(str));
  }
}
