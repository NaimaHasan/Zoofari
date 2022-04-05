import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/Home/Item.dart';
import 'package:zoofari/View/Screens/CategoricalAnimalScreen.dart';

import '../../../Model/Data Definitions/Animal.dart';

class CategoricalScroll extends StatefulWidget {
  const CategoricalScroll(
      {required this.title,required this.animals, Key? key,})
      : super(key: key);
  final String title;
  final List<Animal> animals;

  @override
  _CategoricalScrollState createState() => _CategoricalScrollState();
}

class _CategoricalScrollState extends State<CategoricalScroll> {
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 10) {
                return Container(
                  width: 90,
                  height: 100,
                  decoration:
                      BoxDecoration(color: Theme.of(context).backgroundColor),
                  child: Item(index: index, animals: widget.animals,),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Item(index: index, animals: widget.animals,));
              }
            },
            itemCount: 10,
          ), 
        ),
      ],
    );
  }
}



// ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               if (index == 10) {
//                 return Container(
//                   width: 90,
//                   height: 100,
//                   decoration:
//                       BoxDecoration(color: Theme.of(context).backgroundColor),
//                   child: return Item(element: element),
//                 );
//               } else {
//                 return Padding(
//                   padding: EdgeInsets.only(left: 6, right: 6),
//                   child: return Item(element: ,));
//               }
//             },
//             itemCount: 11,
//           ),


// GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         PageRouteBuilder(
//                           pageBuilder: (context, animation1, animation2) =>
//                               AnimalDetailsScreen(),
//                           transitionDuration: Duration(seconds: 0),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       shadowColor: Colors.white38,
//                       color: Colors.white38,
//                       child: Container(
//                         width: 100,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 110,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Image.asset(
//                                   'Assets/dummy.jpg',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 color: Colors.white38,
//                                 width: 110,
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: Padding(
//                                         padding: EdgeInsets.only(left: 10),
//                                         child: Text(
//                                           widget.animals.length >= index
//                                               ? widget.animals[index].commonName
//                                               : "title",
//                                           //"title",
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(fontSize: 14),
//                                         ),
//                                       ),
//                                     ),
//                                     FavoriteButton(title: 'title')
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
                
        
