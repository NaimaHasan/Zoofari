import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/SearchResults/SearchResultItem.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/SearchResultProvider.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({required this.searchKey, Key? key})
      : super(key: key);

  static const String routeName = '/searchResults';
  final String searchKey;

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late Future _searchResultFuture;

  Future obtainSearchFuture() {
    print("search key passed to the search result screen ----- " +
        widget.searchKey);
    return Provider.of<SearchController>(context, listen: false)
        .getSearchResults(widget.searchKey);
  }

  @override
  void initState() {
    _searchResultFuture = obtainSearchFuture();
    super.initState();
  }

  @override
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
      body: Container(
        child:
            Consumer<SearchController>(builder: (context, searchCtrl, child) {
          return FutureBuilder(
            future: _searchResultFuture,
            builder: (ctx, snapshot) {
              if (searchCtrl.searchedAnimals.isNotEmpty) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 25, bottom: 30, left: 25),
                        child: Text(
                          'All search results for ' + widget.searchKey,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 22),
                        child: GridView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: searchCtrl.searchedAnimals.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 22, bottom: 22),
                              child: SearchResultItem(
                                animal: searchCtrl.searchedAnimals[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (searchCtrl.searchedAnimals.isEmpty) {
                  return Container(
                    child: Image.asset(
                      'Assets/noSearchResults.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }
              return Container(
                child: Image.asset(
                  'Assets/noSearchResults.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

// ListView.builder(
//         itemBuilder: (ctx, index) {
//           if (index == 0) {
//             return Container(
//               padding: EdgeInsets.only(left: 23, top: 25, bottom: 15),
//               child: Text(
//                 'All search results for lion' + widget.searchKey,
//                 style: TextStyle(fontSize: 18),
//               ),
//             );
//           } else {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
//                       child: SearchResultItem(),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       child: SearchResultItem(),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           }
//         },
//         itemCount: 25,
//       ),

// ListView.builder(
//                             itemBuilder: (ctx, index) {
//                               if (index == 0) {
//                                 return Container(
//                                   padding: EdgeInsets.only(left: 23, top: 25, bottom: 15),
//                                   child: Text(
//                                     'All search results for ' + widget.searchKey,
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                 );
//                               } else {
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
//                                           child: SearchResultItem(
//                                             animal: searchCtrl.searchedAnimals.length > index? searchCtrl.searchedAnimals[index- 1] : searchCtrl.searchedAnimals[0],
//                                             ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                           child: SearchResultItem(
//                                             animal: searchCtrl.searchedAnimals.length > index? searchCtrl.searchedAnimals[index- 1] : searchCtrl.searchedAnimals[0]),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 );
//                               }

//                             },
//                             itemCount: searchCtrl.searchedAnimals.length + 1,
//                           );
