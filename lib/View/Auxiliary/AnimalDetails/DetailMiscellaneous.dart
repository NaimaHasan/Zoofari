import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailGridItems.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous({required this.controller, Key? key})
      : super(key: key);
  final ScrollController controller;
  static List<String> miscellaneousList = [
    'Active Time:',
    'Nesting Location:',
    'Water Type:',
    'Estimated Population Growth:',
    'Group Behaviour:',
  ];
  static List<String> dietList = [
    'Meat',
    'Banana',
    'alala',
    'hehehe',
    'Meat',
    'Banana',
    'alala',
    'hehehe',
  ];

  static String funFact =
      'ibhkudufks bhudksfdsk dshusvb dshbsd jhbd sdilhb idabh dsihb sdkhhbf sdhb dskb dsilb dsjb';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Container(
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF852028)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Critically Endangered',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Habitats',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          DetailGridItems(list: dietList),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Fun Fact',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Container(
              height: funFact.length * 0.7,
              child: Text(
                funFact,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ),
          DetailItems(list: miscellaneousList),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFf6fffd),
              child: Text(
                'Diets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          DetailGridItems(list: dietList),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFf6fffd),
              child: Text(
                'Preys',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          DetailGridItems(list: dietList),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFf6fffd),
              child: Text(
                'Predators',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          DetailGridItems(list: dietList),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}
