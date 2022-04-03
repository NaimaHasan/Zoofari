import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailFeaturesTopInformation.dart';
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
  ];
  static List<String> topInformationlist = [
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
          DetailFeaturesTopInformation(),
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
