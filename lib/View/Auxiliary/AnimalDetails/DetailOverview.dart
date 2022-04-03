import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailOverviewItems.dart';

class DetailOverview extends StatelessWidget {
  DetailOverview({Key? key}) : super(key: key);
  static List<String> classificationList = [
    'Kingdom',
    'Phylum',
    'Class',
    'Order',
    'Family',
    'Genus',
  ];
  static List<String> nameList = [
    'Common Name',
    'Scientific Name',
    'Other Names',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DetailOverviewItems(
            title: 'Name',
            list: nameList,
          ),
          Container(
            height: 10,
          ),
          DetailOverviewItems(
            title: 'Scientific Classification',
            list: classificationList,
          ),
        ],
      ),
    );
  }
}
