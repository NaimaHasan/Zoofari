import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/HomeTopAnimalProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScroll.dart';
import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/EndangeredList.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/RandomList.dart';
import 'package:zoofari/View/Screens/SplashScreen.dart';


///Class containing the home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ///Variable required to time of the splashscreen
  bool isSplashScreen = true;

  void initState() {
    super.initState();

    ///Timer for setting duration for the splashScreen
    Timer(
      Duration(seconds: 3),
      () {
        setState(
          () {
            isSplashScreen = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RefreshIndicator(
        key: ValueKey('home screen refresh indicator'),
        color: Theme.of(context).dividerColor,
        onRefresh: () async {
          await Provider.of<HomeTopRandomAnimal>(context, listen: false)
              .getData();
          await Provider.of<Randoms>(context, listen: false).getData();
          await Provider.of<Endangered>(context, listen: false).getData();
        },
        child: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(

                    ///Structure of the home screen using helper classes
                    children: [
                      HomeTopScreen(),
                      const CategoricalScroll(),
                      const RandomList(key: ValueKey("Random")),
                      const EndangeredList(key: ValueKey("Endangered")),
                      Container(height: 50),
                    ],
                  ),
                ),
              ),
            ),
            if (isSplashScreen == true) SplashScreen(),
          ],
        ),
      ),
    );
  }
}
