import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:hive/hive.dart';
import 'Animal.dart';


class Amphibian extends Animal {
  String _avgSpawnSz;
  String _waterType;
  String _incubationPeriod;

  Amphibian(
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
      this._avgSpawnSz,
      this._waterType,
      this._incubationPeriod)
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
            _imageLinks
            );

  String get incubationPeriod => _incubationPeriod;

  set incubationPeriod(String value) {
    _incubationPeriod = value;
  }

  String get waterType => _waterType;

  set waterType(String value) {
    _waterType = value;
  }

  String get avgSpawnSz => _avgSpawnSz;

  set avgSpawnSz(String value) {
    _avgSpawnSz = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({
      'Average Spawn Size': _avgSpawnSz,
      'Incubation Period': _incubationPeriod,
      'Water Type': _waterType
    });
    return info;
  }

}
