import 'package:flutter/material.dart';

import '../../Buttons/FavoriteButton.dart';
import '../../Screens/AnimalDetailsScreen.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({Key? key}) : super(key: key);

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 -30,
              height: MediaQuery.of(context).size.width / 2 -30,
              child: Image.asset(
                'Assets/dummy.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 30,
                height: MediaQuery.of(context).size.width / 2 - 100,
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
              bottom: 1,
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Padding(
                  padding: EdgeInsets.only(left:15, right:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 120,
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
    );
  }
}
