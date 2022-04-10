import 'dart:convert';

import 'package:hive/hive.dart';

part 'Animal.g.dart';

Animal animalFromJson(String str) {
  return Animal.fromJson(json.decode(str));
}

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
  late String rawJsonString;

  Animal(
    rawJsonString,
      { commonName,
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
      imageLinks}
      ){
        this._commonName = commonName;
        this._scientificName = scientificName;
        this._kingdom = kingdom;
        this._order = order;
        this._family = family;
        this.genus = genus;
        this._avgWeight = avgWeight;
        this._maxWeight = maxWeight;
        this._maxLength = maxLength;
        this._maxSpeed = maxSpeed;
        this._lifespan = lifespan;
        this._lifestyle = lifestyle;
        this._skinType = skinType;
        this._funFact = funFact;
        this._diets = diets;
        this._habitats = habitats;
        this._preys = preys;
        this._predators = predators;
        this._colors = colors;
        this._imageLinks = imageLinks;
        this.rawJsonString = rawJsonString; 
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

  factory Animal.fromJson(var json) {
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

    if (json["common_name"] != null) {
      commonNameVar = json["common_name"];
    }
    if (json["classification"]["Scientific Name"] != null) {
      scientificNameVar = json["classification"]["Scientific Name"];
    }
    if (json["classification"]["Kingdom"] != null) {
      kingdomVar = json["classification"]["Kingdom"];
    }
    if (json["classification"]["Phylum"] != null) {
      phylumVar = json["classification"]["Phylum"];
    }
    if (json["classification"]["Class"] != null) {
      classVar = json["classification"]["Class"];
    }
    if (json["classification"]["Order"] != null) {
      orderVar = json["classification"]["Order"];
    }
    if (json["classification"]["Family"] != null) {
      familyVar = json["classification"]["Family"];
    }
    if (json["classification"]["Genus"] != null) {
      genusVar = json["classification"]["Genus"];
    }
    if (json["general_facts"]["Weight"] != null) {
      avgWeightVar = json["general_facts"]["Weight"];
      maxWeightVar = json["general_facts"]["Weight"];
    }
    if (json["general_facts"]["Length"] != null) {
      maxLengthVar = json["general_facts"]["Length"];
    }
    if (json["general_facts"]["Top Speed"] != null) {
      maxSpeedVar = json["general_facts"]["Top Speed"];
    }
    if (json["general_facts"]["Lifespan"] != null) {
      lifespanVar = json["general_facts"]["Lifespan"];
    }
    if (json["general_facts"]["Lifestyle"] != null) {
      lifestyleVar = json["general_facts"]["Lifestyle"];
    }
    if (json["general_facts"]["Skin Type"] != null) {
      skinTypeVar = json["general_facts"]["Skin Type"];
    }
    if (json["general_facts"]["Fun Fact"] != null) {
      funFactVar = json["general_facts"]["Fun Fact"];
    }
    if (json["general_facts"]["Diet"] != null) {
      dietsVar = json["general_facts"]["Diet"];
    }
    if (json["general_facts"]["Habitat"] != null) {
      habitatsVar = json["general_facts"]["Habitat"];
    }
    if (json["general_facts"]["Prey"] != null) {
      preysVar = json["general_facts"]["Prey"];
    }
    if (json["general_facts"]["Predator"] != null) {
      predatorsVar = json["general_facts"]["Predator"];
    }
    if (json["general_facts"]["Color"] != null) {
      colorsVar = json["general_facts"]["Color"];
    }
    if (json["image_link"] != null) {
      imageLinksVar = json["image_link"];
    }

    return Animal(
        "",
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

    return Animal(
        "",
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


}
