import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/ListItem.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

import '../../../../Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import '../../../../Model/Data Definitions/Animal.dart';

class RandomList extends StatefulWidget {
  const RandomList({required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

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
      key: ValueKey(widget.title),
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 15, left: 18, right: 10),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: Color(0xffd4af37),
                size: 18,
              ),
              Container(width: 10),
              Expanded(
                child: Text(
                  widget.title,
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
                          CategoricalAnimalScreen(title: widget.title),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10, top: 8),
                  child: Text(
                    'VIEW MORE',
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
              randomList = Provider.of<Randoms>(context).randomList;
              sliders = randomList
                  .map(
                    (item) => ListItem(animal: item),
              )
                  .toList();
              if (randomList.isNotEmpty) {
                return CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction:
                      (MediaQuery.of(context).size.width / 392.73) * 0.33,
                      height: 185,
                      initialPage: 5),
                  items: sliders,
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting)
                Center(
                  child: CircularProgressIndicator(),
                );
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
