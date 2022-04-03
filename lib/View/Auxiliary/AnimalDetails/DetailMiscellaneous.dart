import 'package:flutter/material.dart';

class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Icon(Icons.warning_amber_outlined),

            ],
          ),
        )
      ],
    );
  }
}
