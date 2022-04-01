import 'Animal.dart';

class Bird extends Animal {
  String _wingspan;
  String _nestingLocation;

  Bird(
      _commonName,
      _scientificName,
      _kingdom,
      _phylum,
      _order,
      _family,
      _genus,
      _avgWeight,
      _maxWeight,
      _maxLength,
      _maxSpeed,
      _lifespan,
      _lifestyle,
      _classType,
      _skinType,
      _funFact,
      _diets,
      _habitats,
      _preys,
      _predators,
      _colors,
      this._wingspan,
      this._nestingLocation)
      : super(
            _commonName,
            _scientificName,
            _kingdom,
            _phylum,
            _order,
            _family,
            _genus,
            _avgWeight,
            _maxWeight,
            _maxLength,
            _maxSpeed,
            _lifespan,
            _lifestyle,
            _classType,
            _skinType,
            _funFact,
            _diets,
            _habitats,
            _preys,
            _predators,
            _colors);

  String get nestingLocation => _nestingLocation;

  set nestingLocation(String value) {
    _nestingLocation = value;
  }

  String get wingspan => _wingspan;

  set wingspan(String value) {
    _wingspan = value;
  }

  @override
  Map<String, String> getAnimalInfo() {
    Map<String, String> info = super.getAnimalInfo();
    info.addAll({'Wingspan': _wingspan, 'NestingLocation': _nestingLocation});
    return info;
  }
}
