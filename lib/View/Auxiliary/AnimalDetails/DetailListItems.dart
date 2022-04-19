import 'package:flutter/material.dart';

///Helper class for structuring the detail drawer
///Items that have listed information are structured here
class DetailListItems extends StatelessWidget {
  const DetailListItems({required this.title, required this.list, Key? key})
      : super(key: key);

  ///List of the information
  final List<String> list;

  ///Title of the item to be displayed
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          ///Structure of the title of the item
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFe9f8f5),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          (list.length == 1 &&
                  (list[0] == 'Not Available' || (list[0] == 'N/A')))
              ? Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      'Not Available',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ///Structure of the list view of the items
              : ListView.builder(
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
                              color: Theme.of(context).primaryColor,
                              size: 12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                list[index],
                                style: TextStyle(
                                  fontSize: 15,
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
                ),
        ],
      ),
    );
  }
}
