import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoofari/Controller/CategoricalController/AnimalProviders/MammalProvider.dart';
import 'package:zoofari/View/Auxiliary/Home/DummyAnimalList.dart';
import 'package:zoofari/View/Auxiliary/Home/Item.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

class MammalList extends StatefulWidget {
  const MammalList({required this.title, Key? key})
    :super(key: key);
  final String title;


  @override
  _MammalListState createState() => _MammalListState();
  
}

class _MammalListState extends State<MammalList> {
  late Future _mammalFuture;

  Future _obtainMammalFuture() {
    return Provider.of<Mammals>(context, listen: false).getData();
  }

  @override
  void initState() {
    _mammalFuture = _obtainMammalFuture();
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
          child: Consumer<Mammals> (
            builder: (context, mammals, child) {
              return FutureBuilder(
                future: _mammalFuture,
                builder: (ctx, snapshot) {
                  
                  if(mammals.mammalList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 10) {
                          return Container(
                            width: 90,
                            height: 100,
                            decoration:
                                BoxDecoration(color: Theme.of(context).backgroundColor),
                            child: Item(animal: mammals.mammalList[index]),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(left: 6, right: 6),
                            child: Item(animal: mammals.mammalList[index]));
                        }
                      },
                      itemCount: mammals.mammalList.length,
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