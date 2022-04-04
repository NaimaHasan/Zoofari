import 'dart:convert';
import 'package:hive/hive.dart';

part 'Animal.g.dart';

// Animal animalFromJson(String str) => json.decode(str).map((x) => Animal.fromJson(x));

Animal animalFromJson(String str) {
  return Animal.fromJson(json.decode(str));
}

@HiveType(typeId: 0)
class Animal {
  @HiveField(0)
  String _commonName;

  @HiveField(1)
  String _scientificName;

  @HiveField(2)
  String _kingdom;

  @HiveField(3)
  String _phylum;

  @HiveField(4)
  String _class;

  @HiveField(5)
  String _order;

  @HiveField(6)
  String _family;

  @HiveField(7)
  String _genus;

  @HiveField(8)
  String _avgWeight;

  @HiveField(9)
  String _maxWeight;

  @HiveField(10)
  String _maxLength;
  
  @HiveField(11)
  String _maxSpeed;

  @HiveField(12)
  String _lifespan;

  @HiveField(13)
  String _lifestyle;

  @HiveField(14)
  String _skinType;

  @HiveField(15)  
  String _funFact;

  @HiveField(16)
  String _diets;

  @HiveField(17)
  String _habitats;

  @HiveField(18)
  String _preys;

  @HiveField(19)
  String _predators;

  @HiveField(20)
  List<dynamic> _colors;

  @HiveField(21)
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

  List<dynamic> getColors() {
    return _colors;
  }

  String getPredators() {
    return _predators;
  }

  set colors(List<dynamic> value) {
    _colors = value;
  }

  String getPreys() {
    return _preys;
  }
  
  set predators(String value) {
    _predators = value;
  }

  String getHabitats() {
    return _habitats;
  }

  set preys(String value) {
    _preys = value;
  }

  String getDiets() {
    return _diets;
  }

  set habitats(String value) {
    _habitats = value;
  }

  String getFunFact() {
    return _funFact;
  }

  set diets(String value) {
    _diets = value;
  }

  String getSkinType() {
    return _skinType;
  }

  set funFact(String value) {
    _funFact = value;
  }

  String getClassType() {
    return _classType;
  }

  set skinType(String value) {
    _skinType = value;
  }

  String getLifestyle() {
    return _lifestyle;
  }

  set lifestyle(String value) {
    _lifestyle = value;
  }

  String getLifespan() {
    return _lifespan;
  }

  set lifespan(String value) {
    _lifespan = value;
  }

  String getMaxSpeed() {
    return _maxSpeed;
  }

  set maxSpeed(String value) {
    _maxSpeed = value;
  }

  String getMaxLength() {
    return _maxLength;
  }

  set maxLength(String value) {
    _maxLength = value;
  }

  String getMaxWeight() {
    return _maxWeight;
  }

  set maxWeight(String value) {
    _maxWeight = value;
  }

  String getAvgWeight() {
    return _avgWeight;
  }

  set avgWeight(String value) {
    _avgWeight = value;
  }

  String getScientificName() {
    return _scientificName;
  }


  set scientificName(String value) {
    _scientificName = value;
  }

  String getCommonName() {
    return _commonName;
  }

  set commonName(String value) {
    _commonName = value;
  }

  String getKingdom() {
    return _kingdom;
  }

  set kingdom(String value) {
    _kingdom = value;
  }

  String getPhylum() {
    return _phylum;
  }

  set phylum(String value) {
    _phylum = value;
  }

  String getOrder() {
    return _order;
  }

  set order(String value) {
    _order = value;
  }

  String getFamily() {
    return _family;
  }

  set family(String value) {
    _family = value;
  }

  String getGenus() {
    return _genus;
  }

  set genus(String value) {
    _genus = value;
  }

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
