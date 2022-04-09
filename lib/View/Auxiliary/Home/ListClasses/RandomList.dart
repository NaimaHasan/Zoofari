import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/RandomProvider.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScrollItem.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

class RandomList extends StatefulWidget {
  const RandomList({required this.title, required this.emoji, Key? key})
    :super(key: key);
  final String title;
  final String emoji;


  @override
  _RandomListState createState() => _RandomListState();
  
}

class _RandomListState extends State<RandomList> {
  late Future _randomFuture;

  Future _obtainRandomFuture() {
    return Provider.of<Randoms>(context, listen: false).getData();
  }

  @override
  void initState() {
    _randomFuture = _obtainRandomFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 35, bottom: 2, left: 15, right: 10),
          child: Row(
            children: [
               Text(
                widget.emoji,
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          CategoricalAnimalScreen(title: widget.title),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                iconSize: 18,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: Consumer<Randoms> (
            builder: (context, randoms, child) {
              return FutureBuilder(
                future: _randomFuture,
                builder: (ctx, snapshot) {
                  if(randoms.randomList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 10) {
                          return Container(
                            width: 90,
                            height: 100,
                            decoration:
                                BoxDecoration(color: Theme.of(context).backgroundColor),
                            child: CategoricalScrollItem(animal: randoms.randomList[index]),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(left: 6, right: 6),
                            child: CategoricalScrollItem(animal: randoms.randomList[index]));
                        }
                      },
                      itemCount: randoms.randomList.length,
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.waiting)
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  return Container();
                }
              );
            }
          ), 
        ),
      ],
    );
  }
}



// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemBuilder: (context, index) {
//     if (index == 10) {
//       return Container(
//         width: 90,
//         height: 100,
//         decoration:
//             BoxDecoration(color: Theme.of(context).backgroundColor),
//         child: Item(index: index, animals: widget.animals,),
//       );
//     } else {
//       return Padding(
//         padding: EdgeInsets.only(left: 6, right: 6),
//         child: Item(index: index, animals: widget.animals,));
//     }
//   },
//   itemCount: 10,
// )