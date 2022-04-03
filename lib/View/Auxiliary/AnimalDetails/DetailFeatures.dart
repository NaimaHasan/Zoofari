import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

class DetailFeatures extends StatelessWidget {
  const DetailFeatures({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            height: 30,
          ),
          Container(
            height: 20,
            child: Text(
              'Colors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4c8e82),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            child: Center(
              child: Text(
                'Orange, Yellow, White, Blue',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
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
