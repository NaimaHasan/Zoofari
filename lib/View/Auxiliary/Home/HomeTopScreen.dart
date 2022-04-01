import 'package:flutter/material.dart';
import 'package:zoofari/View/Buttons/FavoriteMenu.dart';


import 'HomeTopAnimal.dart';

class HomeTopScreen extends StatelessWidget {
  const HomeTopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      child: Stack(
        children: [
          HomeTopRandom(),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 15, right: 5),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 45,
                  child: Image.asset('Assets/LogoWithoutColor.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 8),
                    child: Text(
                      'Zoofari',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 28,
                  child: TextFormField(
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 12, color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        iconSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onSaved: (value) {},
                  ),
                ),
                FavoriteMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
