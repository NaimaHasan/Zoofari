import 'package:flutter/material.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

import '../../../../Controller/SearchController/StringManipulator.dart';

///Helper class for structuring the Endangered list item and Random list item on home screen
class ListItem extends StatefulWidget {
  const ListItem({required this.animal, Key? key}) : super(key: key);

  ///Variable for animal to be displayed on the item
  final Animal animal;

  @override
  State<ListItem> createState() {
    return _ListItemState();
  }
}

class _ListItemState extends State<ListItem> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    ///Tapping on the animal will result in navigation to the animal detail screen of the specific animal
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                AnimalDetailsScreen(
              animal: widget.animal,
            ),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },

      ///Structure of the item
      child: Card(
        color: Colors.white,
        shadowColor: Colors.white,
        elevation: 3,
        child: Container(
          width: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 110,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: widget.animal.imageLinks.isNotEmpty
                      ? Image.network(widget.animal.imageLinks[0],
                          fit: BoxFit.cover,
                          errorBuilder: (context, exception, stackTrace) {
                          return Image.asset(
                            "assets/dummy.jpg",
                            fit: BoxFit.cover,
                          );
                        })
                      : Image.asset('assets/dummy.jpg', fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  width: 110,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            StringManipulator.customizeCommonName(
                                widget.animal.commonName as String),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      FavoriteButton(
                        currentAnimal: widget.animal,
                        onPressed: (_) async => true,
                        showToast: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
