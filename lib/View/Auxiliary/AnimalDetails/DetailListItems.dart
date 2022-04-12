import 'package:flutter/material.dart';

class DetailListItems extends StatelessWidget {
  const DetailListItems({required this.list, Key? key}) : super(key: key);
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35, right: 25, top: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.api,
                    //color: Color(0xFF4c8e82),
                    color: Colors.blueAccent[200],
                    size: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      list[index],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      itemCount: list.length,
      shrinkWrap: true,
    );
  }
}
