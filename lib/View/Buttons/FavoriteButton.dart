import 'package:flutter/material.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import '../../Model/Data Definitions/Animal.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton(
      {required this.title,
      required this.currentAnimal,
      required this.onPressed,
      Key? key,
      required this.showToast})
      : super(key: key);
  final String title;
  final Animal currentAnimal;
  final Future<bool> Function(BuildContext context) onPressed;
  final Function() showToast;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseManager.getFavoritesStream(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          isFavorited =
              DatabaseManager.isFavorite(widget.currentAnimal.commonName);
        }
        isFavorited =
            DatabaseManager.isFavorite(widget.currentAnimal.commonName);

        return IconButton(
          icon: Icon(isFavorited ? Icons.star : Icons.star_outline),
          onPressed: () async {
            var isConfirmed = await widget.onPressed(context);
            if (isConfirmed)
              setState(
                () {
                  if (isFavorited) {
                    DatabaseManager.removeFromFavorites(widget.currentAnimal);
                  } else {
                    DatabaseManager.addToFavorites(widget.currentAnimal);
                  }
                  isFavorited = !isFavorited;
                },
              );
            widget.showToast();
          },
          visualDensity: VisualDensity.compact,
          iconSize: 22,
          splashRadius: 16,
          alignment: Alignment.center,
          color: Colors.yellow[700],
        );
      },
    );
  }
}
