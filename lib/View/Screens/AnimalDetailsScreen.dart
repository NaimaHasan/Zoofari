import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailDrawer.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';

class AnimalDetailsScreen extends StatelessWidget {
  const AnimalDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/animalDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              child: Image.asset(
                'Assets/dummy.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 15, right: 5,top: MediaQuery.of(context).viewPadding.top),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 45,
                  child: Image.asset('Assets/LogoWithoutColor.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 8),
                    child: Text(
                      'title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: FavoriteButton(title: 'title'),
                ),
                FavoriteMenu(),
              ],
            ),
          ),
          DetailDrawer(),
        ],
      ),
    );
  }
}
