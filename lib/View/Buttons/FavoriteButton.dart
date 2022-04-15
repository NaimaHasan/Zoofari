import 'package:flutter/material.dart';
import 'package:zoofari/Controller/Storage/DatabaseManager.dart';

import '../../Model/Data Definitions/Animal.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton(
      {required this.title,
      required this.currentAnimal,
      required this.onPressed,
      Key? key})
      : super(key: key);
  final String title;
  final Animal currentAnimal;
  final Future<bool> Function(BuildContext context) onPressed;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;
  bool isCurrentlyFavorited = false;

  void showToast() {
    // MotionToast(
    //   enableAnimation: true,
    //   animationDuration: Duration(seconds: 0, milliseconds: 300),
    //   // icon: Icons.delete_outline,
    //   icon: (isFavorited) ? Icons.add : Icons.remove,
    //   iconSize: 12,
    //   borderRadius: 10,
    //   toastDuration: Duration(seconds: 1),
    //   width: MediaQuery.of(context).size.width - 100,
    //   primaryColor: Theme.of(context).dividerColor,
    //   height: 35,
    //   description: (!isFavorited)
    //       ? const Text('Removed from Favorites')
    //       : const Text('Added to Favorites'),
    //   position: MOTION_TOAST_POSITION.bottom,
    // ).show(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (!isFavorited)
          ? const Text('Removed from Favorites')
          : const Text('Added to Favorites'),
      backgroundColor: Theme.of(context).dividerColor,
      duration: Duration(seconds: 0, milliseconds: 200),
    ));
  }

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
        isCurrentlyFavorited = isFavorited;

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
            if (isCurrentlyFavorited != isFavorited) showToast();
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
