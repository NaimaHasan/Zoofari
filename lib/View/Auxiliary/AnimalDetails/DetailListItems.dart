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
        return Padding(
          padding: EdgeInsets.only(left: 35, right: 25, top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.5),
                child: Icon(
                  Icons.api,
                  color: Color(0xFF4c8e82),
                  size: 12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Flexible(
                    child: Text(
                      list[index],
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
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
