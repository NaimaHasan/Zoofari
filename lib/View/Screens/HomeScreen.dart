import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScroll.dart';
import 'package:zoofari/View/Auxiliary/Home/DummyAnimalList.dart';
import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';

import '../../Controller/CategoricalController/CategoricalAnimalFetcher.dart';
import '../../Model/Data Definitions/Animal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static final String routeName = '/';
  final List<List<Animal>> animals = List.empty(growable: true);

  static List<String> list = [
    'Random',
    'Endangered',
    'Mammal',
    'Reptile',
    'Amphibian',
    'Bird',
    'Fish',
  ];

  static CategoricalAnimalFetcher randoms = new CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher endangered = new CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher mammals = new CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher birds = new CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher fish = new CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher reptiles = new CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher amphibians = new CategoricalAnimalFetcher();

  static List<List<Animal>> listing = [
    randoms.categoricalAnimalList,
    endangered.categoricalAnimalList,
    mammals.categoricalAnimalList,
    reptiles.categoricalAnimalList,
    amphibians.categoricalAnimalList,
    birds.categoricalAnimalList,
    fish.categoricalAnimalList,
  ];
  


  @override
  Widget build(BuildContext context) {
    populateLists();
    initialListing();
    

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RefreshIndicator(
          onRefresh: () async {
            await fetchAnimals();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: ListView.builder(
              itemBuilder: (context, index) {
                print("----------------------------index $index------------------------");
                if (index == 0) {
                  return HomeTopScreen();
                } else {
                  return CategoricalScroll(
                    title: list[index - 1],
                    animals: listing[index - 1],
                  );
                }
              },
              itemCount: 8,
            ),
          ),
        ));
  }

  void populateLists() {
    DummyAnimalList();
    for(int itr = 0; itr < 7; itr++) {
      animals.add(DummyAnimalList.animalList);
    }
  }

  Future<void> fetchAnimals() async{
    await randoms.getAnimals("animals");
    await endangered.getAnimals("animals");
    await mammals.getAnimals("mammals");
    await reptiles.getAnimals("reptiles");
    await amphibians.getAnimals("amphibians");
    await birds.getAnimals("birds");
    await fish.getAnimals("fish");
  }

  Future<void> initialListing() async {
    await fetchAnimals();
  }
}
