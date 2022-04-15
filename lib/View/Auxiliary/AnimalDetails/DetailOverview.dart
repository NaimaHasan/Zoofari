import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

import '../../../Controller/CategoricalController/CustomAnimalInfo.dart';
import '../../../Controller/SearchController/StringManipulator.dart';
import '../../../Model/Data Definitions/Animal.dart';

class DetailOverview extends StatelessWidget {
  const DetailOverview(
      {required this.controller, Key? key, required this.animal})
      : super(key: key);
  final ScrollController controller;
  final animal;

  @override
  Widget build(BuildContext context) {
    var aml = CustomAnimalInfo.getTypeCastedAnimal(animal);

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
          ),
          Container(
            child: Center(
              child: Text(
                'Scientific Name',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 30),
            child: Container(
              child: Center(
                child: Text(
                  ((aml != null) && (aml is Animal))
                      ? StringManipulator.customizeCommonName(
                          aml.scientificName)
                      : 'scientific name',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          DetailItems(
            title: 'Scientific Classification',
            itemMap: CustomAnimalInfo.getClassificationMap(aml),
          ),
        ],
      ),
    );
  }
}
