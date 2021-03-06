import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/CategoricalAnimalProvider.dart';
import 'package:zoofari/Controller/SearchController/StringManipulator.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';
import 'AnimalDetailsScreen.dart';


///Class structuring thr categorical animal screen
class CategoricalAnimalScreen extends StatefulWidget {
  const CategoricalAnimalScreen({required this.title, Key? key})
      : super(key: key);

  ///Variable for route name of the categorical animal screen
  static const String routeName = '/categoryAnimal';

  ///Variable for title on top of the categorical animal screen
  final String title;

  @override
  _CategoricalAnimalScreenState createState() =>
      _CategoricalAnimalScreenState();
}

class _CategoricalAnimalScreenState extends State<CategoricalAnimalScreen> {

  ///Variables required for fetching the information and structuring the categorical animal screen
  late Future _categoricalFuture;
  List<Animal> listAnimal = List.empty(growable: true);
  late String category;
  int scrollReqCount = 0;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future _obtainCategoricalFuture() {
    listAnimal.clear();
    if (widget.title == "Amphibian") {
      category = "amphibians";
    } else if (widget.title == "Bird") {
      category = "birds";
    } else if (widget.title == "Fish") {
      category = "fish";
    } else if (widget.title == "Mammal") {
      category = "mammals";
    } else if (widget.title == "Reptile") {
      category = "reptiles";
    } else if (widget.title == "Endangered") {
      category = "endangered";
    } else {
      category = "animals";
    }
    return Provider.of<CategoricalProvider>(context, listen: false)
        .getData(category);
  }

  @override
  void initState() {
    _categoricalFuture = _obtainCategoricalFuture();
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

        ///Structuring the leading icon beside the title
        leading: Padding(
          padding: EdgeInsets.only(
              top: (widget.title == 'Endangered') ? 18 : 10,
              bottom: (widget.title == 'Endangered') ? 18 : 10,
              left: 20),
          child: ImageIcon(
            (widget.title == 'Reptile')
                ? AssetImage("assets/categoricalIcons/reptile_icon.png")
                : (widget.title == 'Mammal')
                    ? AssetImage("assets/categoricalIcons/mammal_icon.png")
                    : (widget.title == 'Amphibian')
                        ? AssetImage(
                            "assets/categoricalIcons/amphibian_icon.png")
                        : (widget.title == 'Bird')
                            ? AssetImage(
                                "assets/categoricalIcons/bird_icon.png")
                            : (widget.title == 'Fish')
                                ? AssetImage(
                                    "assets/categoricalIcons/fish_icon.png")
                                : (widget.title == 'Endangered')
                                    ? AssetImage(
                                        "assets/categoricalIcons/endangered_icon.png")
                                    : AssetImage("assets/LogoWithoutColor.png"),
            color: Colors.white,
          ),
        ),
        leadingWidth: 53.0,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FavoriteMenu(
            key: ValueKey('favoriteMenu'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _categoricalFuture,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).dividerColor,
              ),
            );
          }
          return Consumer<CategoricalProvider>(
            builder: ((context, listA, child) {
              if (listA.categoricalList.length > 5) {
                listA.categoricalList.clear();
                Provider.of<CategoricalProvider>(context, listen: false)
                    .getData(category);
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).dividerColor,
                  ),
                );
              }

              if (listAnimal.isEmpty) {
                listAnimal.addAll(listA.categoricalList);
              } else {
                List<String> namesInOldList = List.empty(growable: true);
                for (final item in listAnimal) {
                  namesInOldList.add(item.commonName);
                }
                for (final newAnimal in listA.categoricalList) {
                  if (!namesInOldList.contains(newAnimal.commonName)) {
                    listAnimal.add(newAnimal);
                  }
                }
              }

              if (listAnimal.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).dividerColor,
                  ),
                );
              }

              return SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                header: WaterDropHeader(),
                footer: CustomFooter(
                  builder: (ctx, mode) {
                    Widget body = Text("No more Data");
                    if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator(
                        color: Theme.of(context).dividerColor,
                      );
                      // CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed! Retry!");
                    } else if (mode != LoadStatus.canLoading) {
                      body = Text("Pull up to load more");
                    } else if (mode == LoadStatus.idle) {
                      //
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,

                ///Structure of the categorical screen listview
                child: ListView.builder(
                  key: ValueKey('listViewInCategoricalAnimalScreen'),
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            ///Tapping on the categorical screen item will result in navigation to the animal detail screen
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            AnimalDetailsScreen(
                                      animal: listAnimal[index],
                                    ),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                );
                              },

                              ///Structure of the categorical screen item
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width - 120,
                                    child:
                                        listAnimal[index].imageLinks.isNotEmpty
                                            ? Image.network(
                                                listAnimal[index].imageLinks[0],
                                                fit: BoxFit.cover, errorBuilder:
                                                    (context, exception,
                                                        stackTrace) {
                                                return Image.asset(
                                                  "assets/dummy.jpg",
                                                  fit: BoxFit.cover,
                                                );
                                              })
                                            : Image.asset(
                                                "assets/dummy.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              300,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black45,
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          15,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                StringManipulator
                                                    .customizeCommonName(
                                                        listAnimal[index]
                                                            .commonName),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            FavoriteButton(
                                              currentAnimal: listAnimal[index],
                                              onPressed: (_) async => true,
                                              showToast: () {},
                                              key: ValueKey('favoriteBtn'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: listAnimal.length,
                ),
              );
            }),
          );
        },
      ),
    );
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
    // _refreshController.dispose();
  }

  void _onLoading() async {
    await Provider.of<CategoricalProvider>(context, listen: false)
        .getData(category);
    _refreshController.loadComplete();
  }
}
