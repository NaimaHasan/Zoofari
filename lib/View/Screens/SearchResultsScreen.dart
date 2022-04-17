import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/SearchResultProvider.dart';
import 'package:zoofari/View/Auxiliary/SearchResults/SearchResultItem.dart';
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
        child: Consumer<SearchController>(
          builder: (context, searchCtrl, child) {
            return FutureBuilder(
              future: _searchResultFuture,
              builder: (ctx, snapshot) {
                if (searchCtrl.searchedAnimals.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.only(top: 25, bottom: 30, left: 25),
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
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).dividerColor,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (searchCtrl.searchedAnimals.isEmpty) {
                    return Container(
                      child: Image.asset(
                        'assets/noSearchResults.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                }
                return Container(
                  child: Image.asset(
                    'assets/noSearchResults.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
