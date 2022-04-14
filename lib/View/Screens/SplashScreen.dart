import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).dividerColor,
      child: Center(
        child: Image.asset(
          'Assets/LogoWithoutColor.png',
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
