import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailOverview.dart';

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
      header: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
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
        length: 4, // length of tabs
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Overview'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                  Tab(text: 'Tab 4'),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height-70, //height of TabBarView
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
                  Container(
                    child: Center(
                      child: Text(
                        'Display Tab 2',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Display Tab 3',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Display Tab 4',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      headerHeight: 500,
      drawerHeight: MediaQuery.of(context).size.height,
      color: Theme.of(context).backgroundColor,
      controller: controller,
    );
  }
}
