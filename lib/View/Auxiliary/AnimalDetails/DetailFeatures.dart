import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailFeaturesTopInformation.dart';

class DetailFeatures extends StatelessWidget {
  const DetailFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailFeaturesTopInformation(),
        ],
      ),
    );
  }
}
