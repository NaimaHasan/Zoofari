import 'package:flutter/material.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

class CategoricalScroll extends StatefulWidget {
  const CategoricalScroll({required this.title, required this.emoji, Key? key})
      : super(key: key);
  final String title;
  final String emoji;
  @override
  _CategoricalScrollState createState() => _CategoricalScrollState();
}

class _CategoricalScrollState extends State<CategoricalScroll> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 35, bottom: 2, left: 15, right: 10),
          child: Row(
            children: [
              Text(
                widget.emoji,
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          CategoricalAnimalScreen(title: widget.title),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                iconSize: 18,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 10) {
                return Container(
                  width: 90,
                  height: 110,
                  decoration:
                      BoxDecoration(color: Theme.of(context).backgroundColor),
                  child: GestureDetector(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'View more',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              CategoricalAnimalScreen(title: widget.title),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 12, right: 6)
                      : EdgeInsets.only(left: 6, right: 6),
                  child: GestureDetector(
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
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 5,
                      child: Container(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 110,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'Assets/dummy.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 110,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'title',
                                          maxLines: 1,
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
                  ),
                );
              }
            },
            itemCount: 11,
          ),
        ),

      ],
    );
  }
}
