import 'package:flutter/material.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';

import '../../../Controller/SearchController/StringManipulator.dart';
import '../../Buttons/FavoriteButton.dart';
import '../../Screens/AnimalDetailsScreen.dart';

///Class structuring the items displayed in the search result screen
class SearchResultItem extends StatelessWidget {
  const SearchResultItem({required this.animal, Key? key}) : super(key: key);

  ///Variable for the animal to be displayed in the item
  final Animal animal;

  @override
  Widget build(BuildContext context) {

    ///Tapping on the search result item will result in navigation to the animal detail screen
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

      ///Structure of the search result item
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.width / 2 - 30,
              child: animal.imageLinks.isEmpty
                  ? Image.asset('assets/dummy.jpg', fit: BoxFit.cover)
                  : Image.network(
                      animal.imageLinks[0],
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, stackTrace) {
                        return Image.asset(
                          "assets/dummy.jpg",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
            ),

            ///Gradient on top of the item image so that the item title is always visible
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
                        currentAnimal: animal,
                        onPressed: (_) async => true,
                        showToast: () {},
                        key: ValueKey('favoriteBtn'),
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
