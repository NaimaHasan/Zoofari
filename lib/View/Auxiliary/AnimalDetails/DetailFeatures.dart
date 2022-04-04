import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

class DetailFeatures extends StatelessWidget {
  const DetailFeatures({required this.controller, Key? key}) : super(key: key);
  final ScrollController controller;

  static List<String> otherFeaturelist = [
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
    'Orange',
    'Red',
    'Black',
    'Orange',
    'Red',
    'Black',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Container(
            height: 30,
          ),
          Container(
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
                    Container(
                      height: 10,
                    ),
                    Container(
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
                  ],
                );
              },
              itemCount: topInformationList.length,
              shrinkWrap: true,
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            height: 30,
            child: Text(
              'Colors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4c8e82),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 5),
                          Text(
                            colorList[index * 3],
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            colorList[index * 3 + 1],
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            colorList[index * 3 + 2],
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(width: 5),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      thickness: 0.5,
                    ),
                  ],
                ),
              );
            },
            itemCount: colorList.length ~/ 3,
            shrinkWrap: true,
          ),
          Container(
            height: 28,
          ),
          Container(
            height: 40,
            child: Text(
              'Other features',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4c8e82),
              ),
            ),
          ),
          DetailItems(list: otherFeaturelist)
        ],
      ),
    );
  }
}
