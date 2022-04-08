import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';

import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/EndangeredList.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/RandomList.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static const List<String> list = [
    'Random',
    'Endangered',
    'Mammal',
    'Reptile',
    'Amphibian',
    'Bird',
    'Fish',
  ];



  @override
  Widget build(BuildContext context) {   
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<Randoms>(context, listen: false).getData();
            await Provider.of<Endangered>(context, listen: false).getData();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: 
              SingleChildScrollView(
                child: 
                  Column(
                    children: [
                      HomeTopScreen(), //equivalent to eten card
                      RandomList(title: list[0]),
                      EndangeredList(title: list[1]),
                    ],
                  ) 
              ),
            ),
          ),
        );
  }
}
