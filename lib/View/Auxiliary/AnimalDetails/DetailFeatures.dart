import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
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
  static List<String> colorList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    var aml = CustomAnimalInfo.getTypeCastedAnimal(animal);
    if ((aml != null) && (aml is Animal)) {
      colorList = colorList.toList();
      topInfoMap.clear();
      colorList = List.empty();
      colorList = aml.colors.toList().cast<String>();
      topInfoMap = CustomAnimalInfo.getTopInformationMap(aml);
    }

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: LayoutGrid(
              columnSizes: [1.fr, 1.fr, 1.fr],
              rowSizes: const [auto],
              columnGap: 10,
              children: [
                for (var index = 0; index < 3; index++)
                  Column(
                    children: [
                      Center(
                        child: Text(
                          topInfoMap.keys.elementAt(index),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            topInfoMap.values.elementAt(index),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          (colorList.isNotEmpty)
              ? Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
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

          DetailItems(
            title: 'Other Features',
            itemMap: CustomAnimalInfo.getOtherFeaturesMap(animal),
          )
        ],
      ),
    );
  }
}
