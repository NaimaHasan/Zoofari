import 'package:flutter/material.dart';

class DetailItems extends StatelessWidget {
  const DetailItems({required this.list, Key? key}) : super(key: key);

  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
    );
  }
}
