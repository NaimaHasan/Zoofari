import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    'Amphibian',
    'Bird',
    'Fish',
    'Reptile',
    'Mammal'
  ];

  static CategoricalAnimalFetcher randoms = CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher endangered = CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher mammals = CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher birds = CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher fish = CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher reptiles = CategoricalAnimalFetcher();
  static CategoricalAnimalFetcher amphibians = CategoricalAnimalFetcher();
  


  @override
  Widget build(BuildContext context) {
    populateLists();
    

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RefreshIndicator(
          onRefresh: () async {
            // await Provider.of<RandomProvider>(context, listen: false).getData();
            // await Provider.of<MammalsProvider>(context, listen: false).getData();
            // await Provider.of<ReptileProvider>(context, listen: false).getData();
            // await Provider.of<BirdProvider>(context, listen: false).getData();
            // await Provider.of<FishProvider>(context, listen: false).getData();
            // await Provider.of<AmphibianProvider>(context, listen: false).getData();
            await fetchAnimals();
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
    await randoms.
  }
}
