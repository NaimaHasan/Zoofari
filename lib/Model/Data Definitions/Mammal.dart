import 'Animal.dart';

class Mammal extends Animal {
  String _ageOfWeaning;
  String _avgLitterSz;
  String _ageOfSexualMaturity;

  Mammal(
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
      this._ageOfWeaning,
      this._avgLitterSz,
      this._ageOfSexualMaturity)
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

  String get ageOfWeaning => _ageOfWeaning;

  set ageOfWeaning(String value) {
    _ageOfWeaning = value;
  }

  String get avgLitterSz => _avgLitterSz;

  set avgLitterSz(String value) {
    _avgLitterSz = value;
  }

  String get ageOfSexualMaturity => _ageOfSexualMaturity;

  set ageOfSexualMaturity(String value) {
    _ageOfSexualMaturity = value;
  }

  @override
  Map<String, String> getAnimalInfo() {
    Map<String, String> info = super.getAnimalInfo();
    info.addAll({
      'AgeOfSexualMaturity': _ageOfSexualMaturity,
      'AgeOfWeaning': _ageOfWeaning,
      'AvgLitterSz': _avgLitterSz
    });
    return info;
  }
}
