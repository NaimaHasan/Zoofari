import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:zoofari/Controller/SearchController/StringManipulator.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

import '../../Model/Data Definitions/Animal.dart';

///Class containing the structure of the favorite screen
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const String routeName = '/favorite';
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  ///Variables required for the display of the list of items
  List<Animal> favorites = DatabaseManager.getAllFavorites();
  bool isConfirmed = false;

  ///Function for thr structure of the confirmation dialogue
  Future<bool> confirmUnfavorite(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: const Text('Are you sure you want to unfavorite?'),
            actions: [
              TextButton(
                onPressed: () {
                  isConfirmed = true;

                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Yes',
                  key: ValueKey('confirmRemoval'),
                  style: TextStyle(
                    color: Color(0xFF4c8e82),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  isConfirmed = false;

                  Navigator.of(context).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Color(0xFF4c8e82),
                  ),
                ),
              ),
            ],
          );
        });
    return isConfirmed;
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
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            disabledColor: Colors.yellow,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: DatabaseManager.getFavoritesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            favorites = DatabaseManager.getAllFavorites();
          }
          if (favorites.isEmpty) {
            return Image.asset(
              'assets/noFavorites.jpg',
              fit: BoxFit.cover,
            );
          }

          ///Structure of the favorite list view
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: index == favorites.length - 1 ? 15 : 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Tapping on the favorite screen item will result in navigation to the animal detail screen
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  AnimalDetailsScreen(
                                animal: favorites[index],
                              ),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        },

                        ///Structure of the favorite screen list item
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width - 120,
                              child: favorites[index].imageLinks.isNotEmpty
                                  ? Image.network(
                                      favorites[index].imageLinks[0],
                                      fit: BoxFit.cover, errorBuilder:
                                          (context, exception, stackTrace) {
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
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                          StringManipulator.customizeCommonName(
                                              favorites[index].commonName),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      FavoriteButton(
                                        currentAnimal: favorites[index],
                                        onPressed: confirmUnfavorite,
                                        key: ValueKey(
                                            'favoriteButtonOnFavoriteScreen'),

                                        ///Structure of the toast shown on favorite screen
                                        showToast: () {
                                          if (isConfirmed) {
                                            isConfirmed = false;
                                            MotionToast(
                                              backgroundType:
                                                  BACKGROUND_TYPE.solid,
                                              enableAnimation: false,
                                              icon: Icons.delete_outline,
                                              iconSize: 18,
                                              borderRadius: 7,
                                              toastDuration:
                                                  Duration(milliseconds: 500),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.4,
                                              primaryColor: Color(0xFFe9f8f5),
                                              secondaryColor: Theme.of(context)
                                                  .dividerColor,
                                              height: 40,
                                              description: Text(
                                                'Removed from Favorites',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              position:
                                                  MOTION_TOAST_POSITION.bottom,
                                            ).show(context);
                                          }
                                        },
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
            itemCount: favorites.length,
          );
        },
      ),
    );
  }
}
