import 'package:flutter/material.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

import '../../../Controller/SearchController/StringManipulator.dart';
import '../../Buttons/FavoriteButton.dart';
import '../../Screens/AnimalDetailsScreen.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({required this.animal, Key? key}) : super(key: key);
  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                AnimalDetailsScreen(
              animal: animal,
            ),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.width / 2 - 30,
              child: animal.imageLinks.isEmpty
                  ? Image.asset('Assets/dummy.jpg', fit: BoxFit.cover)
                  : Image.network(
                      animal.imageLinks[0],
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
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width / 2 - 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 100,
                      height: 20,
                      child: Text(
                        StringManipulator.customizeCommonName(
                            animal.commonName),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: FavoriteButton(
                        title: 'title',
                        currentAnimal: animal,
                        onPressed: (_) async => true,
                        showToast: (){},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
