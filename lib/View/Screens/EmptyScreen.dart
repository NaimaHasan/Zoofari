import 'package:flutter/material.dart';

import '../Buttons/FavoriteMenu.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({required this.imageData, Key? key}) : super(key: key);
  static const String routeName = '/empty';
  final String imageData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Zoofari',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FavoriteMenu(
            key: ValueKey('favoriteMenu'),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'Assets/noSearchResults.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
