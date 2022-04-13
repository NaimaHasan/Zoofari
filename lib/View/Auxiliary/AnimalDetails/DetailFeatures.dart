import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';


class DetailFeatures extends StatelessWidget {
  const DetailFeatures({required this.controller, Key? key}) : super(key: key);
  final ScrollController controller;

  static List<String> otherFeatureList = [
    'Maximum Weight:',
    'Maximum Length:',
    'Maximum Speed:',
    'Average Litter Size:',
    'Average Spawn Size:',
    'Wingspan:',
    'Age of Sexual Maturity:',
    'Age of Weaning:',
    'Incubation Period:',
    'Gestation Period:'
  ];
  static List<String> topInformationList = [
    'Lifespan',
    'Average Weight',
    'Skin Type',
  ];
  static List<String> colorList = [
    'Aquamarine',
    'Aquamarine',
    'Aquamarine',
  ];

  @override
  Widget build(BuildContext context) {
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
                            topInformationList[index],
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
                              '18-19 years',
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
                itemCount: topInformationList.length,
                shrinkWrap: true,
              ),
            ),
          ),
          Text(
            'Colors',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4c8e82),
            ),
          ),
          Padding(
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
          ),
          //DetailListItems(title: 'Colors', list: colorList),

          DetailItems(title: 'Other Features', list: otherFeatureList)
        ],
      ),
    );
  }
}
