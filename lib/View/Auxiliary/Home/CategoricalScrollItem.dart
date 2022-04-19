import 'package:flutter/material.dart';

import '../../Screens/CategoricalAnimalScreen.dart';


///Class structuring the each item of the categorical scroll
class CategoricalScrollItem extends StatelessWidget {
  const CategoricalScrollItem(
      {required this.imageURL, required this.title, Key? key})
      : super(key: key);

  ///Variables for the imageURL and title of the scroll item
  final String imageURL;
  final String title;

  @override
  Widget build(BuildContext context) {

    ///Tapping on the scroll item will result in navigation to the respective categorical screens
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

      ///Structure of the scroll items
      child: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                imageURL,
                fit: BoxFit.cover,
                width: 160.0,
                height: 185,
                errorBuilder: (context, exception, stackTrace) {
                  return Image.asset(
                    "assets/dummy.jpg",
                    fit: BoxFit.cover,
                    width: 160.0,
                    height: 185,
                  );
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 160.0,
                  height: 185 / 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.25),
                        Colors.transparent,
                      ],
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
