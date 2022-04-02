import 'Animal.dart';

class EndangeredAnimal extends Animal {
  String _endangeredStatus;

  EndangeredAnimal(
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
      this._endangeredStatus)
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

  String getEndangeredStatus() {
    return _endangeredStatus;
  }

  set endangeredStatus(String value) {
    _endangeredStatus = value;
  }

  @override
  Map<String, String> getAnimalInfo() {
    Map<String, String> info = super.getAnimalInfo();
    info.addAll({'EndangeredStatus': _endangeredStatus});
    return info;
  }
}
