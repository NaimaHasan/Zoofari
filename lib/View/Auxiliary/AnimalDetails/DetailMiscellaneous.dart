import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailListItems.dart';
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
    'hehehe hohoho',
    'Meat hmmmmmmm',
    'Banana',
    'alala',
    'hehehe',
  ];

  static String funFact =
      'ibhkudufks bhudksfdsk dshusvb dshbsd jhbd sdilhb idabh dsihb sdkhhbf dffdb wetwt we wer 3wrwr sdhb dskb dsilb dsjb';

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
                    'Critically Endangered',
                    style: TextStyle(fontSize: 15),
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
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Container(
              height: funFact.length * 0.75,
              child: Text(
                funFact,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
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
          DetailListItems(list: dietList),


          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 30),
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
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Container(
              height: funFact.length * 0.75,
              child: Text(
                funFact,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          DetailItems(list: miscellaneousList),

          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
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
          DetailListItems(list: dietList),


          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
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
          DetailListItems(list: dietList),

          Container(
            height: 40,
          ),
        ],
      ),
    );
  }
}
