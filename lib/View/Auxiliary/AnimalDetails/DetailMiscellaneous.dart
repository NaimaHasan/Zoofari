import 'package:flutter/material.dart';

class DetailMiscellaneous extends StatelessWidget {
  const DetailMiscellaneous({required this.controller, Key? key}) : super(key: key);
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
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.warning_amber_outlined,
                      size: 16,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Text(
                    'Endangered Status:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Critically Endangered',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
