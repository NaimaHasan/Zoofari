import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

import '../../../Controller/CategoricalController/CustomAnimalInfo.dart';
import '../../../Model/Data Definitions/Animal.dart';

///Class forming the structure of the first tab of detail drawer in animal detail screen
class DetailOverview extends StatelessWidget {
  const DetailOverview(
      {required this.controller, Key? key, required this.animal})
      : super(key: key);

  ///Variable for scroll controller used for smooth navigation and animal to be displayed on the screen
  final ScrollController controller;
  final animal;

  @override
  Widget build(BuildContext context) {

    ///Variable for typeCasted animal
    var castedAnimal = CustomAnimalInfo.getTypeCastedAnimal(animal);

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
          ),

          ///Structure of the Scientific name displayed on the overview tab
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
            padding: EdgeInsets.only(top: 5, bottom: 30, left: 40, right: 40),
            child: Center(
              child: Text(
                ((castedAnimal != null) && (castedAnimal is Animal))
                    ? castedAnimal.scientificName
                    : 'scientific name',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          ///Scientific classification of the animal displayed using the helper class DetailItems
          DetailItems(
            title: 'Scientific Classification',
            itemMap: CustomAnimalInfo.getClassificationMap(castedAnimal),
          ),
        ],
      ),
    );
  }
}
