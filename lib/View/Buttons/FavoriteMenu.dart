import 'package:flutter/material.dart';
import 'package:zoofari/View/Screens/FavoriteScreen.dart';

class FavoriteMenu extends StatelessWidget {
  const FavoriteMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: PopupMenuButton(
        offset: const Offset(-20, 40),
        icon: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        color: Colors.white,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            value: 0,
            height: 25,
            padding: EdgeInsets.only(left: 15),
            child: new Container(
              width: 90.0,
              child: Text(
                "View Favorites",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
        onSelected: (item) => {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  FavoriteScreen(),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
        },
      ),
    );
  }
}
