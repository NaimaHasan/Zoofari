import 'package:flutter/material.dart';

class DetailItems extends StatelessWidget {
  const DetailItems({required this.title, required this.list, Key? key})
      : super(key: key);

  final List<String> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4c8e82),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              list[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4c8e82),
                              ),
                            ),
                          ),
                          Text(
                            'Lion',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      thickness: 0.5,
                    ),
                  ],
                ),
              );
            },
            itemCount: list.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
