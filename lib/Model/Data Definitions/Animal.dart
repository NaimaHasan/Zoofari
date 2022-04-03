import 'dart:convert';

// Animal animalFromJson(String str) => json.decode(str).map((x) => Animal.fromJson(x));
Animal animalFromJson(String str) {
  return Animal.fromJson(json.decode(str));
}


class Animal {
  String _commonName;
  String _scientificName;
  String _kingdom;
  String _phylum;
  String _class;
  String _order;
  String _family;
  String _genus;
  String _avgWeight;
  String _maxWeight;
  String _maxLength;
  String _maxSpeed;
  String _lifespan;
  String _lifestyle;
  String _skinType;
  String _funFact;
  String _diets;
  String _habitats;
  String _preys;
  String _predators;
  List<dynamic> _colors;
  List<dynamic> _imageLinks;

  Animal(
      this._commonName,
      this._scientificName,
      this._kingdom,
      this._phylum,
      this._class,
      this._order,
      this._family,
      this._genus,
      this._avgWeight,
      this._maxWeight,
      this._maxLength,
      this._maxSpeed,
      this._lifespan,
      this._lifestyle,
      this._skinType,
      this._funFact,
      this._diets,
      this._habitats,
      this._preys,
      this._predators,
      this._colors,
      this._imageLinks);

    String get commonName => _commonName;

  // List<String> get colors => _colors;

  // set colors(List<String> value) {
  //   _colors = value;
  // }

  // List<String> get predators => _predators;

  // set predators(List<String> value) {
  //   _predators = value;
  // }

  // List<String> get preys => _preys;

  // set preys(List<String> value) {
  //   _preys = value;
  // }

  // List<String> get habitats => _habitats;

  // set habitats(List<String> value) {
  //   _habitats = value;
  // }

  // List<String> get diets => _diets;

  // set diets(List<String> value) {
  //   _diets = value;
  // }

  // String get funFact => _funFact;

  // set funFact(String value) {
  //   _funFact = value;
  // }

  // String get skinType => _skinType;

  // set skinType(String value) {
  //   _skinType = value;
  // }

  // String get lifestyle => _lifestyle;

  // set lifestyle(String value) {
  //   _lifestyle = value;
  // }

  // String get lifespan => _lifespan;

  // set lifespan(String value) {
  //   _lifespan = value;
  // }

  // String get maxSpeed => _maxSpeed;

  // set maxSpeed(String value) {
  //   _maxSpeed = value;
  // }

  // String get maxLength => _maxLength;

  // set maxLength(String value) {
  //   _maxLength = value;
  // }

  // String get maxWeight => _maxWeight;

  // set maxWeight(String value) {
  //   _maxWeight = value;
  // }

  // String get avgWeight => _avgWeight;

  // set avgWeight(String value) {
  //   _avgWeight = value;
  // }

  // String get scientificName => _scientificName;

  // set scientificName(String value) {
  //   _scientificName = value;
  // }

  // String get commonName => _commonName;

  // set commonName(String value) {
  //   _commonName = value;
  // }

  // String get kingdom => _kingdom;

  // set kingdom(String value) {
  //   _kingdom = value;
  // }

  // String get phylum => _phylum;

  // set phylum(String value) {
  //   _phylum = value;
  // }

  // String get order => _order;

  // set order(String value) {
  //   _order = value;
  // }

  // String get family => _family;

  // set family(String value) {
  //   _family = value;
  // }

  // String get genus => _genus;

  // set genus(String value) {
  //   _genus = value;
  // }

  Map<String, dynamic> getAnimalInfo() {
    return {
      'CommonName': _commonName,
      'ScientificName': _scientificName,
      'Kingdom': _kingdom,
      'Phylum': _phylum,
      'Class': _class,
      'Order': _order,
      'Family': _family,
      'Genus': _genus,
      'AvgWeight': _avgWeight,
      'MaxWeight': _maxWeight,
      'Lifespan': _lifespan,
      'Lifestyle': _lifestyle,
      'SkinType': _skinType,
      'FunFact': _funFact,
      'MaxSpeed': _maxSpeed,
      'MaxLength': _maxLength,
      'Diets': _diets,
      'Habitats': _habitats,
      'Preys': _preys,
      'Predators': _predators.toString(),
      'Colors': _colors.toString()
    };

  }


  factory Animal.fromJson(var json) {
    String commonNameVar = "";
    String scientificNameVar = "";
    String kingdomVar = "";
    String phylumVar = "";
    String classVar = "";
    String orderVar = "";
    String familyVar = "";
    String genusVar = "";
    String avgWeightVar = "";
    String maxWeightVar = "";
    String maxLengthVar = "";
    String maxSpeedVar = "";
    String lifespanVar = "";
    String lifestyleVar = "";
    String skinTypeVar = "";
    String funFactVar = "";
    String dietsVar = "";
    String habitatsVar = "";
    String preysVar = "";
    String predatorsVar = "";
    List<dynamic> colorsVar = List.empty(growable: true);
    List<dynamic> imageLinksVar = List.empty(growable: true);

        if( json["common_name"] != null) {
      commonNameVar = json["common_name"];
    }
    if( json["classification"]["Scientific Name"] != null ) {
      scientificNameVar = json["classification"]["Scientific Name"];
    }
    if( json["classification"]["Kingdom"] != null ) {
      kingdomVar = json["classification"]["Kingdom"];
    }
    if( json["classification"]["Phylum"] != null ) {
      phylumVar = json["classification"]["Phylum"];
    }
    if( json["classification"]["Class"] != null ) {
      classVar = json["classification"]["Class"];
    }
    if( json["classification"]["Order"] != null ) {
      orderVar = json["classification"]["Order"];
    }
    if( json["classification"]["Family"] != null ) {
      familyVar = json["classification"]["Family"];
    }
    if( json["classification"]["Genus"] != null ) {
      genusVar = json["classification"]["Genus"];
    }
    if(json["general_facts"]["Weight"] != null) {
      avgWeightVar = json["general_facts"]["Weight"];
      maxWeightVar = json["general_facts"]["Weight"];
    }
    if(json["general_facts"]["Length"] != null) {
      maxLengthVar = json["general_facts"]["Length"];
    }
    if(json["general_facts"]["Top Speed"] != null) {
      maxSpeedVar = json["general_facts"]["Top Speed"];
    }
    if(json["general_facts"]["Lifespan"] != null) {
      lifespanVar = json["general_facts"]["Lifespan"];
    }
    if(json["general_facts"]["Lifestyle"] != null) {
      lifestyleVar = json["general_facts"]["Lifestyle"];
    }
    if(json["general_facts"]["Skin Type"] != null) {
      skinTypeVar = json["general_facts"]["Skin Type"];
    }
    if(json["general_facts"]["Fun Fact"] != null) {
      funFactVar = json["general_facts"]["Fun Fact"];
    }
    if(json["general_facts"]["Diet"] != null) {
      dietsVar = json["general_facts"]["Diet"];
    }
    if(json["general_facts"]["Habitat"] != null) {
      habitatsVar = json["general_facts"]["Habitat"];
    }
    if(json["general_facts"]["Prey"] != null) {
      preysVar = json["general_facts"]["Prey"];
    }
    if(json["general_facts"]["Predator"] != null){
      predatorsVar = json["general_facts"]["Predator"];
    }
    if(json["general_facts"]["Color"] != null) {
      colorsVar = json["general_facts"]["Color"];
    }
    if(json["image_link"] != null) {
      imageLinksVar = json["image_link"];
    }

    
    return Animal(
      commonNameVar,
      scientificNameVar,
      kingdomVar,
      phylumVar,
      classVar,
      orderVar,
      familyVar, 
      genusVar,
      avgWeightVar,
      maxWeightVar,
      maxLengthVar,
      maxSpeedVar,
      lifespanVar,
      lifestyleVar,
      skinTypeVar,
      funFactVar,
      dietsVar,
      habitatsVar,
      preysVar,
      predatorsVar,
      colorsVar,
      imageLinksVar
    );
  }

}
