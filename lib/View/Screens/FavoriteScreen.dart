import 'package:flutter/material.dart';
import 'package:zoofari/Controller/SearchController/StringManipulator.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

import '../../Model/Data Definitions/Animal.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const String routeName = '/favorite';
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();

}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Animal> favorites = DatabaseManager.getAllFavorites();

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
      body: ListView.builder(
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
                              AnimalDetailsScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width - 120,
                          child: favorites[index].imageLinks.isNotEmpty? 
                              Image.network(
                                favorites[index].imageLinks[0],
                                fit: BoxFit.cover,
                              ) :
                              Image.asset(
                                "Assets/dummy.jpg",
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
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      StringManipulator.customizeCommonName( favorites[index].commonName ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  FavoriteButton(title: 'title', currentAnimal: favorites[index],),
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
      ),
    );
  }
}
