import 'package:flutter/material.dart';

class DetailOverviewItems extends StatelessWidget {
  const DetailOverviewItems({required this.title, required this.list, Key? key}) : super(key: key);
  final String title;
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              height: 40,
              color: Colors.white54,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.teal),
                            ),
                          ),
                          Text(
                            'Lion',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.teal.shade300,
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
