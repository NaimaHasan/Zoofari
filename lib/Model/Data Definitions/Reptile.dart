import 'Animal.dart';

class Reptile extends Animal {
  String _gestationPeriod;

  Reptile(
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
      _imageLinks,
      this._gestationPeriod)
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
            _colors,
            _imageLinks);

  String get gestationPeriod => _gestationPeriod;

  set gestationPeriod(String value) {
    _gestationPeriod = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({'GestationPeriod': _gestationPeriod});
    return info;
  }
}
