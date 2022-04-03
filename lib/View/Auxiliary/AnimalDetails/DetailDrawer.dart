import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailFeatures.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailOverview.dart';

import 'DetailMiscellaneous.dart';

class DetailDrawer extends StatefulWidget {
  const DetailDrawer({Key? key}) : super(key: key);

  @override
  _DetailDrawerState createState() => _DetailDrawerState();
}

class _DetailDrawerState extends State<DetailDrawer> {
  final BottomDrawerController controller = BottomDrawerController();
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  Widget build(BuildContext context) {
    return BottomDrawer(
      cornerRadius: 20,
      header: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 25),
        child: GestureDetector(
          onVerticalDragStart: (_) {
            controller.open();
          },
          child: Container(
            height: 2,
            width: 45,
            color: Colors.black,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                labelColor: Color(0xFF4c8e82),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Overview'),
                  Tab(text: 'Features'),
                  Tab(text: 'Miscellaneous'),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 90, //height of TabBarView
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  DetailOverview(),
                  DetailFeatures(),
                  DetailMiscellaneous(),
                ],
              ),
            )
          ],
        ),
      ),
      headerHeight: MediaQuery.of(context).size.height * 0.6 + 20,
      drawerHeight: MediaQuery.of(context).size.height,
      color: Colors.white,
      controller: controller,
    );
  }
}
