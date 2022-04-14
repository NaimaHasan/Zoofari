import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CustomAnimalInfo.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

import '../../../Model/Data Definitions/Animal.dart';

class DetailFeatures extends StatelessWidget {
  const DetailFeatures(
      {required this.controller, Key? key, required this.animal})
      : super(key: key);
  final ScrollController controller;
  final animal;

  static Map<String, String> topInfoMap = {};
  static List<String> colorList = [];

  @override
  Widget build(BuildContext context) {
    var aml = CustomAnimalInfo.getTypeCastedAnimal(animal);
    if ((aml != null) && (aml is Animal)) {
      colorList = colorList.toList();
      colorList.clear();
      topInfoMap.clear();
      colorList = aml.colors.toList().cast<String>();
      topInfoMap = CustomAnimalInfo.getTopInformationMap(aml);
    }

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Center(
                          child: Text(
                            topInfoMap.keys.elementAt(index),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4c8e82),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Center(
                            child: Text(
                              topInfoMap.values.elementAt(index),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: topInfoMap.length,
                shrinkWrap: true,
              ),
            ),
          ),
          (colorList.isNotEmpty)
              ? Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4c8e82),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
          (colorList.isNotEmpty)
              ? Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: colorList.length == 2
                            ? MediaQuery.of(context).size.width / 3.6
                            : 30),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: colorList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (colorList.length == 1 || colorList.length == 2)
                                ? colorList.length
                                : 3,
                        childAspectRatio: colorList.length == 1 ? 20 : 4,
                        mainAxisSpacing: colorList.length == 1 ? 1 : 20,
                        crossAxisSpacing: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Text(
                          colorList[index],
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    },
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
          //DetailListItems(title: 'Colors', list: colorList),

          DetailItems(
            title: 'Other Features',
            itemMap: CustomAnimalInfo.getOtherFeaturesMap(animal),
          )
        ],
      ),
    );
  }
}
