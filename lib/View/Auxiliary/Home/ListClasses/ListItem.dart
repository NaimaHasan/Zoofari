import 'package:flutter/material.dart';
import 'package:zoofari/Model/Data%20Definitions/Animal.dart';
import 'package:zoofari/View/Buttons/FavoriteButton.dart';
import 'package:zoofari/View/Screens/AnimalDetailsScreen.dart';

class ListItem extends StatelessWidget {
  const ListItem({required this.animal, Key? key}) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                AnimalDetailsScreen(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },
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
                  child: animal.imageLinks.isNotEmpty
                      ? Image.network(
                          animal.imageLinks[0],
                          fit: BoxFit.cover,
                        )
                      : Image.asset('Assets/dummy.jpg'),
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
                            animal.commonName as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      FavoriteButton(title: 'title', currentAnimal: animal,)
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
