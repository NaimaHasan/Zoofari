import 'package:flutter/material.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import '../../Model/Data Definitions/Animal.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton({required this.title, required this.currentAnimal, Key? key}) : super(key: key);
  final String title;
  final Animal currentAnimal;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    isFavorited = DatabaseManager.isFavorite(widget.currentAnimal.commonName);
    return IconButton(
      icon: Icon(isFavorited ? Icons.star : Icons.star_outline),
      onPressed: () {
        setState(
          () {
            if(isFavorited) {
              DatabaseManager.removeFromFavorites(widget.currentAnimal);
            } else {
              DatabaseManager.addToFavorites(widget.currentAnimal);
            }
            isFavorited = !isFavorited;
          },
        );
      },
      visualDensity: VisualDensity.compact,
      iconSize: 22,
      splashRadius: 16,
      alignment: Alignment.center,
      color: Colors.yellow[700],
    );
  }
}
