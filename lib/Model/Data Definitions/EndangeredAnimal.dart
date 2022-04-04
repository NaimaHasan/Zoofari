// import 'package:flutter/material.dart';

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
      _imageLinks,
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
            _colors,
            _imageLinks);

  String get endangeredStatus => _endangeredStatus;

  set endangeredStatus(String value) {
    _endangeredStatus = value;
  }

  @override
  Map<String, dynamic> getAnimalInfo() {
    Map<String, dynamic> info = super.getAnimalInfo();
    info.addAll({'Endangered Status': _endangeredStatus});
    return info;
  }
}
