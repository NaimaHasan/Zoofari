import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:zoofari/Controller/CategoricalController/CustomAnimalInfo.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';
import '../../../Model/Data Definitions/Animal.dart';


///Class forming the structure of the second tab of detail drawer in animal detail screen
class DetailFeatures extends StatelessWidget {
  const DetailFeatures(
      {required this.controller, Key? key, required this.animal})
      : super(key: key);

  ///Variable for scroll controller used for smooth navigation and animal to be displayed on the screen
  final ScrollController controller;
  final animal;

  ///Variable for the Map of string to string for the top information in the detail feature tab
  static Map<String, String> topInfoMap = {};

  ///Variable for the list of color of the animal to be displayed on the screen
  static List<String> colorList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {

    ///Variable for typeCasted animal
    var castedAnimal = CustomAnimalInfo.getTypeCastedAnimal(animal);

    ///Fetching the information to be displayed on the screen
    if ((castedAnimal != null) && (castedAnimal is Animal)) {
      colorList = colorList.toList();
      topInfoMap.clear();
      colorList = List.empty();
      colorList = castedAnimal.colors.toList().cast<String>();
      topInfoMap = CustomAnimalInfo.getTopInformationMap(castedAnimal);
    }

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            ///Grid for the top information
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
                  padding: EdgeInsets.only(bottom: 15),
                  ///Grid for displaying the colors
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
                        childAspectRatio: colorList.length == 1 ? 20 : 2.5,
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
          ///Calling the class that displays the other features in a list view
          DetailItems(
            title: 'Other Features',
            itemMap: CustomAnimalInfo.getOtherFeaturesMap(animal),
          )
        ],
      ),
    );
  }
}
