import 'package:flutter/material.dart';

class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.red.shade200,
          child: Row(
            children: [
              Icon(
                Icons.warning_amber_outlined,
                size: 18,
              ),
              Text(
                'Endangered Status:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'Critically Endangered',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
