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
      _imageLinks,
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
            _colors,
            _imageLinks);

  String get groupBehavior => _groupBehavior;

  set groupBehavior(String value) {
    _groupBehavior = value;
  }

  String get estimatedPopulationSz => _estimatedPopulationSz;

  set estimatedPopulationSz(String value) {
    _estimatedPopulationSz = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({
      'GroupBehavior': _groupBehavior,
      'EstimatedPopulationSz': _estimatedPopulationSz
    });
    return info;
  }
}
