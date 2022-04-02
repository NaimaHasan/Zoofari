import 'Animal.dart';

class Fish extends Animal {
  String _groupBehavior;
  String _estimatedPopulationSz;

  Fish(
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
      this._groupBehavior,
      this._estimatedPopulationSz)
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

  String getEstimatedPopulationSz() {
    return _estimatedPopulationSz;
  }

  set estimatedPopulationSz(String value) {
    _estimatedPopulationSz = value;
  }

  String getGroupBehavior() {
    return _groupBehavior;
  }

  set groupBehavior(String value) {
    _groupBehavior = value;
  }

  @override
  Map<String, String> getAnimalInfo() {
    Map<String, String> info = super.getAnimalInfo();
    info.addAll({
      'GroupBehavior': _groupBehavior,
      'EstimatedPopulationSz': _estimatedPopulationSz
    });
    return info;
  }
}
