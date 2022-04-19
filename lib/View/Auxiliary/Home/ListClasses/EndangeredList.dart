import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/View/Auxiliary/Home/ListClasses/ListItem.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

import '../../../../Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import '../../../../Model/Data Definitions/Animal.dart';

///Class structuring the endangered list in the home screen
class EndangeredList extends StatefulWidget {
  const EndangeredList({Key? key}) : super(key: key);

  @override
  _EndangeredListState createState() => _EndangeredListState();
}

class _EndangeredListState extends State<EndangeredList> {

  ///Variables required to display the endangered list on the screen
  late Future _endangeredFuture;
  late List<Animal> endangeredList;
  late List<Widget> sliders;

  ///Getting data using provider
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
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 15, left: 18, right: 10),
          child: Row(
            children: [

              ///Structure of the title and icon and view more button on top of the endangered list
              Icon(
                Icons.warning_amber_outlined,
                color: Color(0xffd4af37),
                size: 18,
              ),
              Container(width: 10),
              Expanded(
                child: Text(
                  'Endangered',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand-SemiBold',
                  ),
                ),
              ),

              ///Tapping on the view more navigates the screen to the endangered screen
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          CategoricalAnimalScreen(title: 'Endangered'),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10, top: 8),
                  child: Text(
                    'VIEW MORE',
                    key: ValueKey("Endangered View More"),
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

        ///Endangered list implemented with the help of carousel slider and helper class ListIem
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: FutureBuilder(
            future: _endangeredFuture,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).dividerColor,
                  ),
                );
              else
                return Consumer<Endangered>(
                  builder: ((context, list, child) {
                    endangeredList = list.endangeredList;
                    sliders = endangeredList
                        .map(
                          (item) => ListItem(
                            animal: item,
                          ),
                        )
                        .toList();
                    if (endangeredList.isNotEmpty) {
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
