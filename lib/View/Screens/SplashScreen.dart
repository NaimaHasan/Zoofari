import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).dividerColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height / 2.1,
            child: Image.asset(
              'Assets/LogoWithoutColor.png',
              width: 120,
              height: 120,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3.3,
                vertical: 40),
            child: LinearProgressIndicator(
              color: Theme.of(context).primaryColor,
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}