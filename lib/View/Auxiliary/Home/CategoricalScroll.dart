import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScrollItem.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

import '../../../Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import '../../../Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import '../../../Model/Data Definitions/Animal.dart';

class CategoricalScroll extends StatefulWidget {
  const CategoricalScroll({required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  _CategoricalScrollState createState() => _CategoricalScrollState();
}

class _CategoricalScrollState extends State<CategoricalScroll> {
  late Future _categoricalFuture;
  late List<Animal> categoricalList;
  late List<Widget> sliders;

  Future _obtainCategoricalFuture() {
    if (widget.title == 'Endangered')
      return Provider.of<Endangered>(context, listen: false).getData();
    else
      return Provider.of<Randoms>(context, listen: false).getData();
  }

  @override
  void initState() {
    _categoricalFuture = _obtainCategoricalFuture();

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
            future: _categoricalFuture,
            builder: (ctx, snapshot) {
              categoricalList = widget.title == 'Endangered'
                  ? Provider.of<Endangered>(context)
                  .endangeredList
                  : Provider.of<Randoms>(context).randomList;
              sliders = categoricalList
                  .map(
                    (item) => CategoricalScrollItem(animal: item),
              )
                  .toList();
              if (categoricalList.isNotEmpty) {
                return CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction:(MediaQuery.of(context).size.width/392.73) * 0.33,
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
