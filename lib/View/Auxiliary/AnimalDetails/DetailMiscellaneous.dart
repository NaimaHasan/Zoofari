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
  static List<String> preyList = List.empty(growable: true);
  static List<String> predatorList = List.empty(growable: true);
  static String notAvail = 'Not Available';
  static String endangeredStatus = '';

  @override
  Widget build(BuildContext context) {
    var aml = CustomAnimalInfo.getTypeCastedAnimal(animal);
    if ((aml != null) && (aml is Animal)) {
      preyList = List.empty();
      predatorList = List.empty();
      endangeredStatus = '';
      preyList = StringManipulator.stringToList(aml.preys);
      predatorList = StringManipulator.stringToList(aml.predators);
      endangeredStatus = CustomAnimalInfo.getEndangeredStatus(aml);
    }
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Container(
              height: 40,
              color: ((aml != null) && (aml is EndangeredAnimal))
                  ? Colors.red.shade100
                  : Color(0xFFe9f8f5),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: Icon(
                      Icons.warning_amber_outlined,
                      color: ((aml != null) && (aml is EndangeredAnimal))
                          ? Color(0xFF852028)
                          : Theme.of(context).primaryColor,
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
                        color: ((aml != null) && (aml is EndangeredAnimal))
                            ? Color(0xFF852028)
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      ((aml != null) && (aml is EndangeredAnimal))
                          ? aml.endangeredStatus
                          : (endangeredStatus.isNotEmpty &&
                                  endangeredStatus != 'Not Available')
                              ? endangeredStatus
                              : 'Not Endangered',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Fun Fact',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 40, top: 10),
            child: Text(
              ((aml != null) && (aml is Animal)) ? aml.funFact : notAvail,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ),
          Text(
            'Habitats',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 40, top: 10),
            child: Text(
              ((aml != null) && (aml is Animal)) ? aml.habitats : notAvail,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ),
          DetailItems(
            title: 'Additional Information',
            itemMap: CustomAnimalInfo.getMiscellaneousMap(aml),
          ),
          DetailListItems(title: 'Preys', list: preyList),
          DetailListItems(title: 'Predators', list: predatorList),
        ],
      ),
    );
  }
}
