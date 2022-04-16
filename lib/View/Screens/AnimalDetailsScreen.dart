import 'package:flutter/material.dart';
import 'package:zoofari/Controller/CategoricalController/CustomAnimalInfo.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailDrawer.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';

import '../../Controller/SearchController/StringManipulator.dart';
import '../../Model/Data Definitions/Animal.dart';

class AnimalDetailsScreen extends StatelessWidget {
  const AnimalDetailsScreen({Key? key, required this.animal}) : super(key: key);
  static const String routeName = '/animalDetail';
  final animal;

  @override
  Widget build(BuildContext context) {
    var aml = CustomAnimalInfo.getTypeCastedAnimal(animal);
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
              child: ((aml != null) &&
                      (aml is Animal) &&
                      (aml.imageLinks.isNotEmpty))
                  ? Image.network(aml.imageLinks[0], fit: BoxFit.cover,
                      errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        "Assets/dummy.jpg",
                        fit: BoxFit.cover,
                      );
                    })
                  : Image.asset(
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
            padding: EdgeInsets.only(
                bottom: 10,
                left: 15,
                right: 5,
                top: MediaQuery.of(context).viewPadding.top),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    //TODO: This shows splash if routed to homeScreen
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation1, animation2) =>
                    //         HomeScreen(),
                    //     transitionDuration: Duration(seconds: 0),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 35,
                    width: 45,
                    child: Image.asset('Assets/LogoWithoutColor.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 8),
                    child: Text(
                      ((aml != null) && (aml is Animal))
                          ? StringManipulator.customizeCommonName(
                              aml.commonName)
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
                    title: 'title',
                    currentAnimal: animal,
                    onPressed: (_) async => true,
                    showToast: () {},
                  ),
                ),
                FavoriteMenu(),
              ],
            ),
          ),
          DetailDrawer(animal: animal),
        ],
      ),
    );
  }
}
