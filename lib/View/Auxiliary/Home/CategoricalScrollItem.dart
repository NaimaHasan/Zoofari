import 'package:flutter/material.dart';

import '../../Screens/CategoricalAnimalScreen.dart';

class CategoricalScrollItem extends StatelessWidget {
  const CategoricalScrollItem(
      {required this.imageURL, required this.title, Key? key})
      : super(key: key);
  final String imageURL;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                CategoricalAnimalScreen(title: title, key: UniqueKey()),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },
      child: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                imageURL,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrace) {
                  return Image.asset(
                    "assets/dummy.jpg",
                    fit: BoxFit.cover,
                  );
                },
                width: 160.0,
                height: 185,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(50, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
