import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScroll.dart';
import 'package:zoofari/View/Auxiliary/Home/HomeTopScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  static List<String> list = [
    'Random',
    'Endangered',
    'Amphibian',
    'Bird',
    'Fish',
    'Reptile',
    'Mammal'
  ];
  static List<String> emojiList = [
    '🔀   ',
    '⚠️   ',
    '🐸   ',
    '🐥   ',
    '🐟   ',
    '🐢   ',
    '🐕   '
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return HomeTopScreen();
            } else {
              return CategoricalScroll(
                title: list[index - 1],
                emoji: emojiList[index -1]
              );
            }
          },
          itemCount: 8,
        ),
      ),
    );
  }
}
