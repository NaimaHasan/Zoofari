import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/HomeTopAnimalProvider.dart';
import 'package:zoofari/Controller/SearchController/StringManipulator.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

///Class structuring the random animal displayed on top of the home screen
class HomeTopAnimal extends StatefulWidget {
  const HomeTopAnimal({Key? key}) : super(key: key);

  @override
  _HomeTopAnimalState createState() => _HomeTopAnimalState();
}

class _HomeTopAnimalState extends State<HomeTopAnimal> {

  ///Variables required for displaying the animal
  late Animal topRandomAnimal;
  late Future _topFuture;

  Future _obtainTopRandomFuture() =>
      Provider.of<HomeTopRandomAnimal>(context, listen: false).getData();

  @override
  void initState() {
    _topFuture = _obtainTopRandomFuture();
    topRandomAnimal = HomeTopRandomAnimal().homeTopRandomAnimal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ///Tapping on the random animal will result in navigating to the animal detail screen of the specific animal
    return GestureDetector(
      onTap: () {
        try {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  AnimalDetailsScreen(
                animal: topRandomAnimal,
              ),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        } catch (e) {
          // print(e);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: double.infinity,
        child: FutureBuilder(
          future: _topFuture,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Stack(
                  children: [
                    Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
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
                    )
                  ],
                ),
              );
            } else {
              return Consumer<HomeTopRandomAnimal>(
                builder: ((context, futureAnimal, child) {
                  topRandomAnimal = futureAnimal.homeTopRandomAnimal;
                  return Stack(
                    children: [

                      ///Structure of the image displayed on top of the sceren
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        child: topRandomAnimal.imageLinks.isNotEmpty
                            ? Image.network(
                                topRandomAnimal.imageLinks[0],
                                fit: BoxFit.cover,
                                errorBuilder: (context, exception, stackTrace) {
                                  return Image.asset(
                                    "assets/dummy.jpg",
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : Image.asset(
                                "assets/dummy.jpg",
                                fit: BoxFit.cover,
                              ),
                      ),

                      ///Gradient applied on top of the image so that the title and other widgets on top of the image can be visible for all images
                      Container(
                        width: MediaQuery.of(context).size.width,
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromRGBO(0, 0, 0, 0.35),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      ///Structure of the name of the animal displayed
                      Positioned(
                        bottom: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  StringManipulator.customizeCommonName(
                                      topRandomAnimal.commonName),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),

                            ///Favorite button structured using the helper class Favorite button
                            FavoriteButton(
                              key:ValueKey('homeTopAnimalFavoriteButton'),
                              currentAnimal: topRandomAnimal,
                              onPressed: (_) async => true,
                              showToast: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
