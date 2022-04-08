import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/EndangeredProvider.dart';
import 'package:zoofari/View/Auxiliary/Home/Item.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

class EndangeredList extends StatefulWidget {
  const EndangeredList({required this.title, Key? key})
    :super(key: key);
  final String title;


  @override
  _EndangeredListState createState() => _EndangeredListState();
  
}

class _EndangeredListState extends State<EndangeredList> {
  late Future _endangeredFuture;

  Future _obtainEndangeredFuture() {
    return Provider.of<Endangered>(context, listen: false).getData();
  }

  @override
  void initState() {
    _endangeredFuture = _obtainEndangeredFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 2, left: 15, right: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 18),
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
          height: 160,
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Consumer<Endangered> (
            builder: (context, endangered, child) {
              return FutureBuilder(
                future: _endangeredFuture,
                builder: (ctx, snapshot) {
                  if(endangered.endangeredList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 10) {
                          return Container(
                            width: 90,
                            height: 100,
                            decoration:
                                BoxDecoration(color: Theme.of(context).backgroundColor),
                            child: Item(animal: endangered.endangeredList[index]),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(left: 6, right: 6),
                            child: Item(animal: endangered.endangeredList[index]));
                        }
                      },
                      itemCount: endangered.endangeredList.length,
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