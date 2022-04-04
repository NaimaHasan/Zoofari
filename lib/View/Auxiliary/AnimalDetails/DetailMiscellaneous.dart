import 'package:flutter/material.dart';

class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous({required this.controller, Key? key})
      : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.red.shade100,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Icon(
                    Icons.warning_amber_outlined,
                    color: Color(0xFF852028),
                    size: 16,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Text(
                    'Endangered Status:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF852028)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Critically Endangered',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Icon(
                    Icons.api,
                    size: 16,
                    color: Color(0xFF4c8e82),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Text(
                    'Active Time:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4c8e82)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Diurnal',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
