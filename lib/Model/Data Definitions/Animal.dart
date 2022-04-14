import 'dart:convert';

import 'package:hive/hive.dart';

part 'Animal.g.dart';

@HiveType(typeId: 0)
class Animal {
  late String _commonName;
  late String _scientificName;
  late String _kingdom;
  late String _phylum;
  late String _classType;
  late String _order;
  late String _family;
  late String _genus;
  late String _avgWeight;
  late String _maxWeight;
  late String _maxLength;
  late String _maxSpeed;
  late String _lifespan;
  late String _lifestyle;
  late String _skinType;
  late String _funFact;
  late String _diets;
  late String _habitats;
  late String _preys;
  late String _predators;
  late List<dynamic> _colors;
  late List<dynamic> _imageLinks;

  @HiveField(0)
  late dynamic rawJsonString;

  Animal(rawJsonString,
      {commonName,
      scientificName,
      kingdom,
      phylum,
      classType,
      order,
      family,
      genus,
      avgWeight,
      maxWeight,
      maxLength,
      maxSpeed,
      lifespan,
      lifestyle,
      skinType,
      funFact,
      diets,
      habitats,
      preys,
      predators,
      colors,
      imageLinks}) {
    this.rawJsonString = rawJsonString != null ? rawJsonString : "";

    this._commonName = commonName != null
        ? commonName
        : rawJsonString["common_name"] != null
            ? rawJsonString["common_name"]
            : "not available";
    this._scientificName = scientificName != null
        ? scientificName
        : rawJsonString["classification"]["Scientific Name"] != null
            ? rawJsonString["classification"]["Scientific Name"]
            : "not available";
    this._kingdom = kingdom != null
        ? kingdom
        : rawJsonString["classification"]["Kingdom"] != null
            ? rawJsonString["classification"]["Kingdom"]
            : "not available";
    this._phylum = phylum != null
        ? phylum
        : rawJsonString["classification"]["Phylum"] != null
            ? rawJsonString["classification"]["Phylum"]
            : "not available";
    this._classType = classType != null
        ? classType
        : rawJsonString["classification"]["Class"] != null
            ? rawJsonString["classification"]["Class"]
            : "not available";
    this._order = order != null
        ? order
        : rawJsonString["classification"]["Order"] != null
            ? rawJsonString["classification"]["Order"]
            : "not available";
    this._family = family != null
        ? family
        : rawJsonString["classification"]["Family"] != null
            ? rawJsonString["classification"]["Family"]
            : "not available";
    this._genus = genus != null
        ? genus
        : rawJsonString["classification"]["Genus"] != null
            ? rawJsonString["classification"]["Genus"]
            : "not available";

    this._avgWeight = avgWeight != null
        ? avgWeight
        : rawJsonString["general_facts"]["Weight"] != null
            ? rawJsonString["general_facts"]["Weight"]
            : "not available";
    this._maxWeight = maxWeight != null
        ? maxWeight
        : rawJsonString["general_facts"]["Weight"] != null
            ? rawJsonString["general_facts"]["Weight"]
            : "not available";
    this._maxLength = maxLength != null
        ? maxLength
        : rawJsonString["general_facts"]["Length"] != null
            ? rawJsonString["general_facts"]["Length"]
            : "not available";
    this._maxSpeed = maxSpeed != null
        ? maxSpeed
        : rawJsonString["general_facts"]["Top Speed"] != null
            ? rawJsonString["general_facts"]["Top Speed"]
            : "not available";
    this._lifespan = lifespan != null
        ? lifespan
        : rawJsonString["general_facts"]["Lifespan"] != null
            ? rawJsonString["general_facts"]["Lifespan"]
            : "not available";
    this._lifestyle = lifestyle != null
        ? lifestyle
        : rawJsonString["general_facts"]["Lifestyle"] != null
            ? rawJsonString["general_facts"]["Lifestyle"]
            : "not available";
    this._skinType = skinType != null
        ? skinType
        : rawJsonString["general_facts"]["Skin Type"] != null
            ? rawJsonString["general_facts"]["Skin Type"]
            : "not available";
    this._funFact = funFact != null
        ? funFact
        : rawJsonString["general_facts"]["Fun Fact"] != null
            ? rawJsonString["general_facts"]["Fun Fact"]
            : "not available";
    this._diets = diets != null
        ? diets
        : rawJsonString["general_facts"]["Diet"] != null
            ? rawJsonString["general_facts"]["Diet"]
            : "not available";
    this._habitats = habitats != null
        ? habitats
        : rawJsonString["general_facts"]["Habitat"] != null
            ? rawJsonString["general_facts"]["Habitat"]
            : "not available";
    this._preys = preys != null
        ? preys
        : rawJsonString["general_facts"]["Prey"] != null
            ? rawJsonString["general_facts"]["Prey"]
            : rawJsonString["general_facts"]["Main Prey"] != null
                ? rawJsonString["general_facts"]["Main Prey"]
                : "not available";

    this._predators = predators != null
        ? predators
        : rawJsonString["general_facts"]["Predator"] != null
            ? rawJsonString["general_facts"]["Predator"]
            : "not available";
    this._colors = colors != null
        ? colors
        : rawJsonString["general_facts"]["Color"] != null
            ? rawJsonString["general_facts"]["Color"]
            : List.empty();
    this._imageLinks = imageLinks != null
        ? imageLinks
        : rawJsonString["image_link"] != null
            ? rawJsonString["image_link"]
            : List.empty();
  }

  String get scientificName => _scientificName;

  set scientificName(String value) {
    _scientificName = value;
  }

  get commonName => _commonName;

  set commonName(dynamic commonName) {
    _commonName = commonName;
  }

  String get kingdom => _kingdom;

  set kingdom(String value) {
    _kingdom = value;
  }

  String get phylum => _phylum;

  set phylum(String value) {
    _phylum = value;
  }

  String get classType => _classType;
  set classType(String value) {
    _classType = value;
  }

  String get order => _order;
  set order(String value) {
    _order = value;
  }

  String get family => _family;
  set family(String value) {
    _family = value;
  }

  String get genus => _genus;
  set genus(String value) {
    _genus = value;
  }

  String get avgWeight => _avgWeight;
  set avgWeight(String value) {
    _avgWeight = value;
  }

  String get maxWeight => _maxWeight;
  set maxWeight(String value) {
    _maxWeight = value;
  }

  String get maxLength => _maxLength;
  set maxLength(String value) {
    _maxLength = value;
  }

  String get maxSpeed => _maxSpeed;
  set maxSpeed(String value) {
    _maxSpeed = value;
  }

  String get lifespan => _lifespan;
  set lifespan(String value) {
    _lifespan = value;
  }

  String get lifestyle => _lifestyle;
  set lifestyle(String value) {
    _lifestyle = value;
  }

  String get skinType => _skinType;
  set skinType(String value) {
    _skinType = value;
  }

  String get funFact => _funFact;
  set funFact(String value) {
    _funFact = value;
  }

  String get diets => _diets;
  set diets(String value) {
    _diets = value;
  }

  String get habitats => _habitats;
  set habitats(String value) {
    _habitats = value;
  }

  String get preys => _preys;
  set preys(String value) {
    _preys = value;
  }

  String get predators => _predators;
  set predators(String value) {
    _predators = value;
  }

  List<dynamic> get colors => _colors;
  set colors(List<dynamic> value) {
    _colors = value;
  }

  List<dynamic> get imageLinks => _imageLinks;
  set imageLinks(List<dynamic> value) {
    _imageLinks = value;
  }

  Map<String, dynamic> getAnimalInfo() {
    return {
      'CommonName': _commonName,
      'ScientificName': _scientificName,
      'Kingdom': _kingdom,
      'Phylum': _phylum,
      'Class': _classType,
      'Order': _order,
      'Family': _family,
      'Genus': _genus,
      'Avg Weight': _avgWeight,
      'Max Weight': _maxWeight,
      'Lifespan': _lifespan,
      'Lifestyle': _lifestyle,
      'Skin Type': _skinType,
      'Fun Fact': _funFact,
      'Max Speed': _maxSpeed,
      'Max Length': _maxLength,
      'Diets': _diets,
      'Habitats': _habitats,
      'Preys': _preys,
      'Predators': _predators.toString(),
      'Colors': _colors.toString(),
      'Image Links': _imageLinks
    };
  }

  factory Animal.fromJson(var jsonParam) {
    if (jsonParam is String) jsonParam = json.decode(jsonParam);

    String commonNameVar = "Not Available";
    String scientificNameVar = "Not Available";
    String kingdomVar = "Not Available";
    String phylumVar = "Not Available";
    String classVar = "Not Available";
    String orderVar = "Not Available";
    String familyVar = "Not Available";
    String genusVar = "Not Available";
    String avgWeightVar = "Not Available";
    String maxWeightVar = "Not Available";
    String maxLengthVar = "Not Available";
    String maxSpeedVar = "Not Available";
    String lifespanVar = "Not Available";
    String lifestyleVar = "Not Available";
    String skinTypeVar = "Not Available";
    String funFactVar = "Not Available";
    String dietsVar = "Not Available";
    String habitatsVar = "Not Available";
    String preysVar = "Not Available";
    String predatorsVar = "Not Available";
    List<dynamic> colorsVar = List.empty(growable: true);
    List<dynamic> imageLinksVar = List.empty(growable: true);

    if (jsonParam["common_name"] != null) {
      commonNameVar = jsonParam["common_name"];
    }
    if (jsonParam["classification"]["Scientific Name"] != null) {
      scientificNameVar = jsonParam["classification"]["Scientific Name"];
    }
    if (jsonParam["classification"]["Kingdom"] != null) {
      kingdomVar = jsonParam["classification"]["Kingdom"];
    }
    if (jsonParam["classification"]["Phylum"] != null) {
      phylumVar = jsonParam["classification"]["Phylum"];
    }
    if (jsonParam["classification"]["Class"] != null) {
      classVar = jsonParam["classification"]["Class"];
    }
    if (jsonParam["classification"]["Order"] != null) {
      orderVar = jsonParam["classification"]["Order"];
    }
    if (jsonParam["classification"]["Family"] != null) {
      familyVar = jsonParam["classification"]["Family"];
    }
    if (jsonParam["classification"]["Genus"] != null) {
      genusVar = jsonParam["classification"]["Genus"];
    }
    if (jsonParam["general_facts"]["Weight"] != null) {
      avgWeightVar = jsonParam["general_facts"]["Weight"];
      maxWeightVar = jsonParam["general_facts"]["Weight"];
    }
    if (jsonParam["general_facts"]["Length"] != null) {
      maxLengthVar = jsonParam["general_facts"]["Length"];
    }
    if (jsonParam["general_facts"]["Top Speed"] != null) {
      maxSpeedVar = jsonParam["general_facts"]["Top Speed"];
    }
    if (jsonParam["general_facts"]["Lifespan"] != null) {
      lifespanVar = jsonParam["general_facts"]["Lifespan"];
    }
    if (jsonParam["general_facts"]["Lifestyle"] != null) {
      lifestyleVar = jsonParam["general_facts"]["Lifestyle"];
    }
    if (jsonParam["general_facts"]["Skin Type"] != null) {
      skinTypeVar = jsonParam["general_facts"]["Skin Type"];
    }
    if (jsonParam["general_facts"]["Fun Fact"] != null) {
      funFactVar = jsonParam["general_facts"]["Fun Fact"];
    }
    if (jsonParam["general_facts"]["Diet"] != null) {
      dietsVar = jsonParam["general_facts"]["Diet"];
    }
    if (jsonParam["general_facts"]["Habitat"] != null) {
      habitatsVar = jsonParam["general_facts"]["Habitat"];
    }
    if (jsonParam["general_facts"]["Prey"] != null) {
      preysVar = jsonParam["general_facts"]["Prey"];
    } else if (jsonParam["general_facts"]["Main Prey"] != null) {
      preysVar = jsonParam["general_facts"]["Main Prey"];
    }
    if (jsonParam["general_facts"]["Predator"] != null) {
      predatorsVar = jsonParam["general_facts"]["Predator"];
    }
    if (jsonParam["general_facts"]["Color"] != null) {
      colorsVar = jsonParam["general_facts"]["Color"];
    }
    if (jsonParam["image_link"] != null) {
      imageLinksVar = jsonParam["image_link"];
    }

    return Animal(jsonParam,
        commonName: commonNameVar,
        scientificName: scientificNameVar,
        kingdom: kingdomVar,
        phylum: phylumVar,
        classType: classVar,
        order: orderVar,
        family: familyVar,
        genus: genusVar,
        avgWeight: avgWeightVar,
        maxWeight: maxWeightVar,
        maxLength: maxLengthVar,
        maxSpeed: maxSpeedVar,
        lifespan: lifespanVar,
        lifestyle: lifestyleVar,
        skinType: skinTypeVar,
        funFact: funFactVar,
        diets: dietsVar,
        habitats: habitatsVar,
        preys: preysVar,
        predators: predatorsVar,
        colors: colorsVar,
        imageLinks: imageLinksVar);
  }

  factory Animal.emptyAnimal() {
    String commonNameVar = "Not Available";
    String scientificNameVar = "Not Available";
    String kingdomVar = "Not Available";
    String phylumVar = "Not Available";
    String classVar = "Not Available";
    String orderVar = "Not Available";
    String familyVar = "Not Available";
    String genusVar = "Not Available";
    String avgWeightVar = "Not Available";
    String maxWeightVar = "Not Available";
    String maxLengthVar = "Not Available";
    String maxSpeedVar = "Not Available";
    String lifespanVar = "Not Available";
    String lifestyleVar = "Not Available";
    String skinTypeVar = "Not Available";
    String funFactVar = "Not Available";
    String dietsVar = "Not Available";
    String habitatsVar = "Not Available";
    String preysVar = "Not Available";
    String predatorsVar = "Not Available";
    List<dynamic> colorsVar = List.empty(growable: true);
    List<dynamic> imageLinksVar = List.empty(growable: true);

    return Animal("",
        commonName: commonNameVar,
        scientificName: scientificNameVar,
        kingdom: kingdomVar,
        phylum: phylumVar,
        classType: classVar,
        order: orderVar,
        family: familyVar,
        genus: genusVar,
        avgWeight: avgWeightVar,
        maxWeight: maxWeightVar,
        maxLength: maxLengthVar,
        maxSpeed: maxSpeedVar,
        lifespan: lifespanVar,
        lifestyle: lifestyleVar,
        skinType: skinTypeVar,
        funFact: funFactVar,
        diets: dietsVar,
        habitats: habitatsVar,
        preys: preysVar,
        predators: predatorsVar,
        colors: colorsVar,
        imageLinks: imageLinksVar);
  }

  static Animal animalFromJson(String str) {
    return Animal.fromJson(json.decode(str));
  }
}
