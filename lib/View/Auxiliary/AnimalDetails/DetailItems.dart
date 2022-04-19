import 'package:flutter/material.dart';

///Helper class for structuring the detail drawer
///Items that are displayed as list with a heading and information places horizontally side by side are structured here
class DetailItems extends StatelessWidget {
  const DetailItems({required this.title, required this.itemMap, Key? key})
      : super(key: key);

  ///Map of the heading of information and the information
  final Map<String, String> itemMap;

  ///Title to be placed on top of the list
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(bottom: (itemMap.isNotEmpty) ? 30 : 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: (itemMap.isNotEmpty) ? 30 : 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            ///List view structure for the list if the list is not empty
            (itemMap.isNotEmpty)
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 25, top: 3),
                                    child: Text(
                                      itemMap.keys.elementAt(index),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        itemMap.values.elementAt(index),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
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
                    itemCount: itemMap.length,
                    shrinkWrap: true,
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                    child: Text(
                      'Not Available',
                      style: TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
