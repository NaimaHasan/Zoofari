import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/CategoricalAnimalProvider.dart';
import 'package:zoofari/Controller/SearchController/StringManipulator.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';

import 'AnimalDetailsScreen.dart';

class CategoricalAnimalScreen extends StatefulWidget {
  const CategoricalAnimalScreen({required this.title, Key? key})
      : super(key: key);

  static const String routeName = '/categoryAnimal';
  final String title;

  @override
  _CategoricalAnimalScreenState createState() => _CategoricalAnimalScreenState();

}

class _CategoricalAnimalScreenState extends State<CategoricalAnimalScreen> {
  late Future _categoricalFuture;
  List<Animal> listAnimal = List.empty(growable: true);
  late String category;
  int scrollReqCount = 0;

  Future _obtainCategoricalFuture() {
    if(widget.title == "Amphibian") {
      category = "amphibians";
    } else if(widget.title == "Bird") {
      category = "birds";
    } else if(widget.title == "Fish") {
      category = "fish";
    } else if(widget.title == "Mammal") {
      category = "mammals";
    } else if(widget.title == "Reptile") {
      category = "reptiles";
    } else if(widget.title == "Endangered") {
      category = "endangered";
    } else {
      category = "animals";
    }
    return Provider.of<CategoricalProvider>(context, listen: false).getData(category);
  }

  @override
  void initState() {
    _categoricalFuture = _obtainCategoricalFuture();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Animal sth = Animal.emptyAnimal();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FavoriteMenu(),
        ],
      ),
      body: FutureBuilder(  
        future: _categoricalFuture,
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              )
            );
          }
          return Consumer<CategoricalProvider>(  
            builder: ((context, listA, child) {
              if(listAnimal.isEmpty) {
                listAnimal.addAll(listA.categoricalList);
              } else {
                List<String> namesInOldList = List.empty(growable: true);
                for(final item in listAnimal) {
                  namesInOldList.add(item.commonName);
                }
                for(final newAnimal in listA.categoricalList) {
                  if(! namesInOldList.contains(newAnimal.commonName)) {
                    listAnimal.add(newAnimal);
                  }
                }
              }

              if(listAnimal.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    bool isTop = metrics.pixels == 0;
                    if (isTop) {
                      print('At the top');
                    } else {
                      scrollReqCount++;
                      if(scrollReqCount == 1 && ! (snapshot.connectionState == ConnectionState.waiting) ) {
                        Provider.of<CategoricalProvider>(context, listen: false).getData(category);
                        scrollReqCount = 0;
                      }
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) =>
                                        AnimalDetailsScreen(
                                      animal: listAnimal[index],
                                    ), 
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width - 120,
                                    child: listAnimal[index].imageLinks.isNotEmpty? 
                                    Image.network(listAnimal[index].imageLinks[0]) :
                                    Image.asset("Assets/dummy.jpg", fit: BoxFit.cover,),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.width - 300,
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
                                      width: MediaQuery.of(context).size.width - 15,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width:
                                                  MediaQuery.of(context).size.width * 0.6,
                                              child: Text(
                                                StringManipulator.customizeCommonName( listAnimal[index].commonName ),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            FavoriteButton(
                                              title: 'title',
                                              currentAnimal: listAnimal[index],
                                              onPressed: (_) async => true,
                                              showToast: () {},
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
                )
              );
            }),
          );
        },
      )
    );
  }
}
