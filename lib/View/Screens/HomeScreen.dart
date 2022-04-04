import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScroll.dart';
import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';

import '../../Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import '../../Model/Data Definitions/Animal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  List<Animal> animals = List.empty(growable: true);

  static List<String> list = [
    'Random',
    'Endangered',
    'Amphibian',
    'Bird',
    'Fish',
    'Reptile',
    'Mammal'
  ];

  @override
  Widget build(BuildContext context) {
    CategoricalAnimalFetcher ctf = new CategoricalAnimalFetcher();
    Provider.of<CategoricalAnimalFetcher>(context, listen: false)
        .getAnimals('animals');
    animals.addAll(ctf.categoricalAnimalList);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RefreshIndicator(
          onRefresh: () async {
            // await Provider.of<CategoricalAnimals>(context, listen: false)
            //     .getData("animals");
            // CategoricalAnimalFetcher ct = new CategoricalAnimalFetcher();
            // await ct.getAnimals("animals");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
            //
            // await ct.getAnimals("animals");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
            //
            // await ct.getAnimals("amphibians");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
            //
            // await ct.getAnimals("birds");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
            //
            // await ct.getAnimals("fish");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
            //
            // await ct.getAnimals("reptiles");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
            //
            // await ct.getAnimals("mammals");
            // animals.add(CategoricalAnimalFetcher.categoricalAnimalList);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return HomeTopScreen();
                } else {
                  return CategoricalScroll(
                    title: list[index - 1],
                    animals: Provider.of<CategoricalAnimalFetcher>(context)
                        .categoricalAnimalList,
                  );
                }
              },
              itemCount: 8,
            ),
          ),
        ));
  }
}
