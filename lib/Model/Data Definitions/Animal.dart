import 'dart:convert';

Animal animalFromJson(String str) => json.decode(str).map((x) => Animal.fromJson(x));


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
  List<String> _diets;
  List<String> _habitats;
  List<String> _preys;
  List<String> _predators;
  List<String> _colors;
  List<String> _imageLinks;

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

  List<String> get colors => _colors;

  set colors(List<String> value) {
    _colors = value;
  }

  List<String> get predators => _predators;

  set predators(List<String> value) {
    _predators = value;
  }

  List<String> get preys => _preys;

  set preys(List<String> value) {
    _preys = value;
  }

  List<String> get habitats => _habitats;

  set habitats(List<String> value) {
    _habitats = value;
  }

  List<String> get diets => _diets;

  set diets(List<String> value) {
    _diets = value;
  }

  String get funFact => _funFact;

  set funFact(String value) {
    _funFact = value;
  }

  String get skinType => _skinType;

  set skinType(String value) {
    _skinType = value;
  }

  String get lifestyle => _lifestyle;

  set lifestyle(String value) {
    _lifestyle = value;
  }

  String get lifespan => _lifespan;

  set lifespan(String value) {
    _lifespan = value;
  }

  String get maxSpeed => _maxSpeed;

  set maxSpeed(String value) {
    _maxSpeed = value;
  }

  String get maxLength => _maxLength;

  set maxLength(String value) {
    _maxLength = value;
  }

  String get maxWeight => _maxWeight;

  set maxWeight(String value) {
    _maxWeight = value;
  }

  String get avgWeight => _avgWeight;

  set avgWeight(String value) {
    _avgWeight = value;
  }

  String get scientificName => _scientificName;

  set scientificName(String value) {
    _scientificName = value;
  }

  String get commonName => _commonName;

  set commonName(String value) {
    _commonName = value;
  }

  String get kingdom => _kingdom;

  set kingdom(String value) {
    _kingdom = value;
  }

  String get phylum => _phylum;

  set phylum(String value) {
    _phylum = value;
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

  Map<String, String> getAnimalInfo() {
    return {
      'CommonName': _commonName,
      'ScientificName': _scientificName,
      'Kingdom': _kingdom,
      'Phylum': _phylum,
      'Class': _class,
      'Order': _order,
      'Family': _family,
      'Genus': _genus,
      'AvgWeight': _avgWeight.toString(),
      'MaxWeight': _maxWeight.toString(),
      'Lifespan': _lifespan.toString(),
      'Lifestyle': _lifestyle,
      'SkinType': _skinType,
      'FunFact': _funFact,
      'MaxSpeed': _maxSpeed.toString(),
      'MaxLength': _maxLength.toString(),
      'Diets': _diets.toString(),
      'Habitats': _habitats.toString(),
      'Preys': _preys.toString(),
      'Predators': _predators.toString(),
      'Colors': _colors.toString()
    };

  }

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    json["common_name"],
    json["classification"]["Scientific Name"],
    json["classification"]["Kingdom"],
    json["classification"]["Phylum"],
    json["classification"]["Class"],
    json["classification"]["Order"],
    json["classification"]["Family"],
    json["classification"]["Genus"],
    json["general_facts"]["Weight"],
    json["general_facts"]["Weight"],
    json["general_facts"]["Length"],
    json["general_facts"]["Top Speed"],
    json["general_facts"]["Lifespan"],
    json["general_facts"]["Lifestyle"],
    json["general_facts"]["Skin Type"],
    json["general_facts"]["Fun Fact"],
    json["general_facts"]["Diet"],
    json["general_facts"]["Habitat"],
    json["general_facts"]["Prey"],
    json["general_facts"]["Predator"],
    json["general_facts"]["Color"],
    json["general_facts"]["image_link"]
  );
}
