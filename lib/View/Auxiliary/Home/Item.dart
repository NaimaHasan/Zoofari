import 'package:flutter/material.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

class Item extends StatelessWidget {
  const Item({required this.animal,  Key? key}) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            child: Card(
              shadowColor: Colors.white38,
              color: Colors.white38,
              child: Container(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: 
                        animal.imageLinks.isNotEmpty?Image.network(animal.imageLinks[0]):Image.asset('Assets/dummy.jpg'),  
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white38,
                        width: 110,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  animal.commonName as String,
                                  //"title",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            FavoriteButton(title: 'title')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}