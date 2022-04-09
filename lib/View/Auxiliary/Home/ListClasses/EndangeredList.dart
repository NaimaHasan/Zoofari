import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/ListItem.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

import '../../../../Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import '../../../../Model/Data Definitions/Animal.dart';

class EndangeredList extends StatefulWidget {
  const EndangeredList({required this.title, required this.icon, Key? key})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  _EndangeredListState createState() => _EndangeredListState();
}

class _EndangeredListState extends State<EndangeredList> {
  late Future _endangeredFuture;
  late List<Animal> endangeredList;
  late List<Widget> sliders;

  Future _obtainEndangeredFuture() {
    return Provider.of<Endangered>(context, listen: false).getData();
  }

  @override
  void initState() {
    _endangeredFuture = _obtainEndangeredFuture();

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
          child: Consumer<Endangered> ( 
            builder: ((context, list, child) {
              return FutureBuilder(
                future: _endangeredFuture,
                builder: (ctx, snapshot) {
                  endangeredList = list.endangeredList;
                  sliders = endangeredList
                      .map(
                        (item) => ListItem(animal: item),
                      )
                      .toList();
                  if (endangeredList.isNotEmpty) {
                    return CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: false,
                          viewportFraction:
                              ( 392.73 / MediaQuery.of(context).size.width) * 0.33,
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
              );

            }),
           )        
          ),
      ],
    );
  }
}
