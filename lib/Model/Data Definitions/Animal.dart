class Animal {
  String _commonName;
  String _scientificName;
  String _kingdom;
  String _phylum;
  String _order;
  String _family;
  String _genus;
  double _avgWeight;
  double _maxWeight;
  double _maxLength;
  double _maxSpeed;
  double _lifespan;
  String _lifestyle;
  String _classType;
  String _skinType;
  String _funFact;
  List<String> _diets;
  List<String> _habitats;
  List<String> _preys;
  List<String> _predators;
  List<String> _colors;

  Animal(
      this._commonName,
      this._scientificName,
      this._kingdom,
      this._phylum,
      this._order,
      this._family,
      this._genus,
      this._avgWeight,
      this._maxWeight,
      this._maxLength,
      this._maxSpeed,
      this._lifespan,
      this._lifestyle,
      this._classType,
      this._skinType,
      this._funFact,
      this._diets,
      this._habitats,
      this._preys,
      this._predators,
      this._colors);

  List<String> getColors() {
    return _colors;
  }

  set colors(List<String> value) {
    _colors = value;
  }

  List<String> getPredators() {
    return _predators;
  }

  set predators(List<String> value) {
    _predators = value;
  }

  List<String> getPreys() {
    return _preys;
  }

  set preys(List<String> value) {
    _preys = value;
  }

  List<String> getHabitats() {
    return _habitats;
  }

  set habitats(List<String> value) {
    _habitats = value;
  }

  List<String> getDiets() {
    return _diets;
  }

  set diets(List<String> value) {
    _diets = value;
  }

  String getFunFact() {
    return _funFact;
  }

  set funFact(String value) {
    _funFact = value;
  }

  String getSkinType() {
    return _skinType;
  }

  set skinType(String value) {
    _skinType = value;
  }

  String getClassType() {
    return _classType;
  }

  set classType(String value) {
    _classType = value;
  }

  String getLifestyle() {
    return _lifestyle;
  }

  set lifestyle(String value) {
    _lifestyle = value;
  }

  double getLifespan() {
    return _lifespan;
  }

  set lifespan(double value) {
    _lifespan = value;
  }

  double getMaxSpeed() {
    return _maxSpeed;
  }

  set maxSpeed(double value) {
    _maxSpeed = value;
  }

  double getMaxLength() {
    return _maxLength;
  }

  set maxLength(double value) {
    _maxLength = value;
  }

  double getMaxWeight() {
    return _maxWeight;
  }

  set maxWeight(double value) {
    _maxWeight = value;
  }

  double getAvgWeight() {
    return _avgWeight;
  }

  set avgWeight(double value) {
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

  Map<String, String> getAnimalInfo() {
    return {
      'CommonName': _commonName,
      'ScientificName': _scientificName,
      'Kingdom': _kingdom,
      'Phylum': _phylum,
      'Order': _order,
      'Family': _family,
      'Genus': _genus,
      'AvgWeight': _avgWeight.toString(),
      'MaxWeight': _maxWeight.toString(),
      'Lifespan': _lifespan.toString(),
      'Lifestyle': _lifestyle,
      'ClassType': _classType,
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
}
