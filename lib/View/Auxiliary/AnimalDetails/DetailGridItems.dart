import 'package:flutter/material.dart';

class DetailGridItems extends StatelessWidget {
  const DetailGridItems({required this.list, Key? key}) : super(key: key);
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: list.length == 2
              ? MediaQuery.of(context).size.width / 3.6
              : 30),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (list.length == 1 ||
                  list.length == 2 ||
                  list.length == 3)
              ? list.length
              : 4,
          childAspectRatio: list.length == 1 ? 20 : 4,
          mainAxisSpacing: list.length == 1 ? 1 : 20,
          crossAxisSpacing: 4),
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Text(
            list[index],
            style: TextStyle(fontSize: 15),
          ),
        );
      },
    );
  }
}
