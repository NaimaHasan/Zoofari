import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/HomeTopAnimalProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScroll.dart';

import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/EndangeredList.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/RandomList.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<HomeTopRandomAnimal>(context, listen: false).getData();
          await Provider.of<Randoms>(context, listen: false).getData();
          await Provider.of<Endangered>(context, listen: false).getData();
        },
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeTopScreen(),
                  CategoricalScroll(),
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
      ),
    );
  }
}
