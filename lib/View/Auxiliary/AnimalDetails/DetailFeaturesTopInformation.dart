import 'package:flutter/material.dart';


class DetailFeaturesTopInformation extends StatelessWidget {
  const DetailFeaturesTopInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  'Lifespan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4c8e82),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  'Average Weight',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4c8e82),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  'Skin Type',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4c8e82),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  '10 kg',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  'Furry boi',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
