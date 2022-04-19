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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSplashScreen = true;

  void initState() {
    super.initState();
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
                    children: [
                      HomeTopScreen(),
                      const CategoricalScroll(),
                      const RandomList(
                        key: ValueKey("Random"),
                        title: 'Random',
                        icon: Icons.shuffle,
                      ),
                      const EndangeredList(
                        key: ValueKey("Endangered"),
                        title: 'Endangered',
                        icon: Icons.warning_amber_outlined,
                      ),
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
