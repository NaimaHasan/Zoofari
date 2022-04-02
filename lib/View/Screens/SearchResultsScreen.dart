import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/SearchResults/SearchResultItem.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({required this.searchKey, Key? key})
      : super(key: key);

  static const String routeName = '/searchResults';
  final String searchKey;

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Zoofari',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FavoriteMenu(),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(left: 23, top: 25, bottom: 15),
              child: Container(
                child: Text(
                  'All search results for lion' + searchKey,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: SearchResultItem(),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SearchResultItem(),
                    ),
                  ],
                ),
              ],
            );
          }
        },
        itemCount: 25,
      ),
    );
  }
}
