import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CustomAnimalInfo.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailListItems.dart';

import '../../../Controller/SearchController/StringManipulator.dart';
import '../../../Model/Data Definitions/Animal.dart';
import 'DetailItems.dart';

///Class forming the structure of the third tab of detail drawer in animal detail screen
class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous(
      {required this.controller, Key? key, required this.animal})
      : super(key: key);

  ///Animal to be displayed on the screen
  final animal;

  ///Variable for controller for smooth navigation
  final ScrollController controller;

  ///Variables required to display the information on the screen
  static List<String> preyList = List.empty(growable: true);
  static List<String> predatorList = List.empty(growable: true);
  static String notAvail = 'Not Available';
  static String endangeredStatus = '';
  static bool isEndangered = false;

  @override
  Widget build(BuildContext context) {
    ///Variable for typeCasted animal
    var castedAnimal = CustomAnimalInfo.getTypeCastedAnimal(animal);

    ///List of endangered keywords
    List<String> endangeredKeywords = [
      'Extinct',
      'Extinct in the Wild',
      'Endangered',
      'Critically Endangered',
      'Vulnerable',
      'Near Threatened'
    ];

    ///Fetching the information to be displayed on the screen
    if ((castedAnimal != null) && (castedAnimal is Animal)) {
      preyList = List.empty();
      predatorList = List.empty();
      endangeredStatus = '';
      preyList = StringManipulator.stringToList(castedAnimal.preys);
      predatorList = StringManipulator.stringToList(castedAnimal.predators);
      endangeredStatus = CustomAnimalInfo.getEndangeredStatus(castedAnimal);
    }
    if (endangeredStatus == "")
      endangeredStatus = "n/a";
    else {
      isEndangered = endangeredKeywords
          .any((listElement) => listElement.contains(endangeredStatus));
    }
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          ///Structure of the endangered status on top of the screen
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Container(
              height: 40,
              color: ((castedAnimal != null) && isEndangered)
                  ? Colors.red.shade100
                  : Color(0xFFe9f8f5),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: Icon(
                      Icons.warning_amber_outlined,
                      color: ((castedAnimal != null) && isEndangered)
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
                        color: ((castedAnimal != null) && isEndangered)
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
                      ((castedAnimal != null) && isEndangered)
                          ? endangeredStatus
                          : (endangeredStatus == "n/a")
                              ? notAvail
                              : 'Not Endangered',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Structure of the fun fact displayed on the screen
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
              ((castedAnimal != null) && (castedAnimal is Animal))
                  ? castedAnimal.funFact
                  : notAvail,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ),

          ///Structure of the habitat displayed on the screen
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
              ((castedAnimal != null) && (castedAnimal is Animal))
                  ? castedAnimal.habitats
                  : notAvail,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ),

          ///Additional information, preys, predators structured using the helper classes
          DetailItems(
            title: 'Additional Information',
            itemMap: CustomAnimalInfo.getMiscellaneousMap(castedAnimal),
          ),
          DetailListItems(title: 'Preys', list: preyList),
          DetailListItems(title: 'Predators', list: predatorList),
        ],
      ),
    );
  }
}
