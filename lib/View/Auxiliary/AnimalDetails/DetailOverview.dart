import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailItems.dart';

class DetailOverview extends StatelessWidget {
  const DetailOverview({required this.controller, Key? key}) : super(key: key);
  final ScrollController controller;
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
      controller: controller,
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
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 30),
            child: Container(
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
          ),
          DetailItems(
            title: 'Scientific Classification',
            list: classificationList,
          ),
        ],
      ),
    );
  }
}
