import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
          ),
          Container(
            child: Center(
              child: Text(
                'Scientific Name',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4c8e82),
                ),
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            child: Center(
              child: Text(
                'Panthera leo',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 30,
          ),
          Container(
            height: 40,
            child: Text(
              'Scientific Classification',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4c8e82),
              ),
            ),
          ),
          DetailItems(
            list: classificationList,
          ),
        ],
      ),
    );
  }
}
