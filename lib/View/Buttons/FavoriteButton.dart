import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorited ? Icons.star : Icons.star_outline),
      onPressed: () {
        setState(
          () {
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
