import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const String routeName = '/favorite';
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Favorites'),
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
                          child: Image.asset(
                            'Assets/dummy.jpg',
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
                                  Colors.black87,
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
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      'title',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  FavoriteButton(title: 'title'),
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
        itemCount: 25,
      ),
    );
  }
}
