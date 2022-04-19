import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CustomAnimalInfo.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailDrawer.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';

import '../../Controller/SearchController/StringManipulator.dart';
import '../../Model/Data Definitions/Animal.dart';

///Class structuring the animal detail screen
class AnimalDetailsScreen extends StatelessWidget {
  const AnimalDetailsScreen({Key? key, required this.animal}) : super(key: key);

  ///Variable for route name for the animal detail screen
  static const String routeName = '/animalDetail';

  ///Variable for the animal to be displayed
  final animal;

  @override
  Widget build(BuildContext context) {

    ///Variable for the typeCasted animal
    var castedAnimal = CustomAnimalInfo.getTypeCastedAnimal(animal);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [

          ///Structure of the image to be displayed on top of the animal detail screen
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              child: ((castedAnimal != null) &&
                      (castedAnimal is Animal) &&
                      (castedAnimal.imageLinks.isNotEmpty))
                  ? Image.network(castedAnimal.imageLinks[0], fit: BoxFit.cover,
                      errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        "assets/dummy.jpg",
                        fit: BoxFit.cover,
                      );
                    })
                  : Image.asset(
                      'assets/dummy.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          ///Gradient applied on top of the image so that the icons and title on top are visible
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
            padding: EdgeInsets.only(
                bottom: 10,
                left: 15,
                right: 5,
                top: MediaQuery.of(context).viewPadding.top),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 45,
                  child: Image.asset('assets/LogoWithoutColor.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 8),
                    child: Text(
                      ((castedAnimal != null) && (castedAnimal is Animal))
                          ? StringManipulator.customizeCommonName(
                              castedAnimal.commonName)
                          : 'title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: FavoriteButton(
                    currentAnimal: animal,
                    onPressed: (_) async => true,
                    showToast: () {},
                    key: ValueKey('favoriteBtn'),
                  ),
                ),
                FavoriteMenu(
                  key: ValueKey('favoriteMenu'),
                ),
              ],
            ),
          ),
          DetailDrawer(key: ValueKey("Detail Drawer"),animal: animal),
        ],
      ),
    );
  }
}
