import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalCarousel.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScroll.dart';

import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
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
                  CategoricalCarousel(),
                  CategoricalScroll(
                    title: 'Random',
                    icon: Icons.shuffle,
                  ),
                  CategoricalScroll(
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
