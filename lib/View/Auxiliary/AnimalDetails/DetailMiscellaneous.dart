import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CustomAnimalInfo.dart';
import 'package:zoofari/Model/Data%20Definitions/EndangeredAnimal.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailListItems.dart';

import '../../../Controller/SearchController/StringManipulator.dart';
import '../../../Model/Data Definitions/Animal.dart';
import 'DetailItems.dart';

class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous(
      {required this.controller, Key? key, required this.animal})
      : super(key: key);
  final animal;
  final ScrollController controller;
  static List<String> dummyList = ['whatever', 'gth'];
  static List<String> dietList = [];
  static List<String> preyList = [];
  static List<String> predatorList = [];
  static String notAvail = 'Not Available';

  @override
  Widget build(BuildContext context) {
    var aml = CustomAnimalInfo.getTypeCastedAnimal(animal);
    if ((aml != null) && (aml is Animal)) {
      dietList.clear();
      preyList.clear();
      predatorList.clear();
      dietList = StringManipulator.stringToList(aml.diets);
      preyList = StringManipulator.stringToList(aml.preys);
      predatorList = StringManipulator.stringToList(aml.predators);
    }
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          ((aml != null) && (aml is EndangeredAnimal))
              ? Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 40,
                    color: Colors.red.shade100,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width * 0.12,
                          child: Icon(
                            Icons.warning_amber_outlined,
                            color: Color(0xFF852028),
                            size: 16,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Text(
                            'Endangered Status:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF852028)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            aml.endangeredStatus,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
          Text(
            'Fun Fact',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4c8e82),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 10),
            child: Container(
              height: ((aml != null) && (aml is Animal))
                  ? aml.funFact.length * 1.25
                  : 40.0,
              child: Text(
                ((aml != null) && (aml is Animal)) ? aml.funFact : notAvail,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ),
          DetailListItems(title: 'Diets', list: dietList),
          Text(
            'Habitats',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4c8e82),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 10),
            child: Container(
              height: ((aml != null) && (aml is Animal))
                  ? aml.habitats.length * 1.10
                  : notAvail.length * 10.0,
              child: Text(
                ((aml != null) && (aml is Animal)) ? aml.habitats : notAvail,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ),
          DetailItems(
              title: 'Additional Information',
              itemMap: CustomAnimalInfo.getMiscellaneousMap(aml)),
          DetailListItems(title: 'Preys', list: preyList),
          DetailListItems(title: 'Predators', list: predatorList),
        ],
      ),
    );
  }
}
