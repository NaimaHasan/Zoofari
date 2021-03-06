import 'package:flutter/material.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import '../../Model/Data Definitions/Animal.dart';


///Class structuring the favorite button on every screen
class FavoriteButton extends StatefulWidget {
  FavoriteButton({
    required this.currentAnimal,
    required this.onPressed,
    required this.showToast,
    Key? key,
  }) : super(key: key);

  ///Variables required for properly displaying and updating the favorite button and favorite list
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
          icon: Icon(isFavorited &&
                  (widget.currentAnimal.commonName != 'Not Available')
              ? Icons.star
              : Icons.star_outline),
          onPressed: () async {
            if (widget.currentAnimal.commonName == 'Not Available') return;
            var isConfirmed = await widget.onPressed(context);
            if (isConfirmed)
              setState(
                () {
                  if (isFavorited) {
                    DatabaseManager.removeFromFavorites(widget.currentAnimal);
                    widget.showToast();
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
      },
    );
  }
}
