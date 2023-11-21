import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/ListItem.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

import '../../../../Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import '../../../../Model/Data Definitions/Animal.dart';

class RandomList extends StatefulWidget {
  const RandomList({Key? key}) : super(key: key);

  @override
  _RandomListState createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  late Future _randomFuture;
  late List<Animal> randomList;
  late List<Widget> sliders;

  Future _obtainRandomFuture() {
    return Provider.of<Randoms>(context, listen: false).getData();
  }

  @override
  void initState() {
    _randomFuture = _obtainRandomFuture();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 15, left: 18, right: 10),
          child: Row(
            children: [
              Icon(
                Icons.shuffle,
                color: Color(0xffd4af37),
                size: 18,
              ),
              Container(width: 10),
              Expanded(
                child: Text(
                  'Random',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand-SemiBold',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          CategoricalAnimalScreen(title: 'Random'),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10, top: 8),
                  child: Text(
                    'VIEW MORE',
                    key: ValueKey("Random View More"),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: FutureBuilder(
            future: _randomFuture,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).dividerColor,
                  ),
                );
              else
                return Consumer<Randoms>(
                  builder: ((context, list, child) {
                    randomList = list.randomList;
                    sliders = randomList
                        .map(
                          (item) => ListItem(
                            animal: item,
                          ),
                        )
                        .toList();
                    if (randomList.isNotEmpty) {
                      return CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: false,
                            viewportFraction:
                                (392.73 / MediaQuery.of(context).size.width) *
                                    0.33,
                            height: 185,
                            initialPage: 5),
                        items: sliders,
                      );
                    } else
                      return Container();
                  }),
                );
            },
          ),
        ),
      ],
    );
  }
}
