import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailFeatures.dart';
import 'package:zoofari/View/Auxiliary/AnimalDetails/DetailOverview.dart';
import 'package:zoofari/View/Auxiliary/Helpers/CustomBottomDrawer.dart';

import 'DetailMiscellaneous.dart';


///Class forming the structure of the detail drawer of the animal detail screen
class DetailDrawer extends StatefulWidget {
  const DetailDrawer({Key? key, required this.animal}) : super(key: key);

  ///Animal displayed on the screen
  final animal;

  @override
  _DetailDrawerState createState() => _DetailDrawerState();
}

class _DetailDrawerState extends State<DetailDrawer> {

  ///Controllers required for smooth navigation of the tabs
  final CustomBottomDrawerController controller =
      CustomBottomDrawerController();
  late PageController _pageController;
  List<ScrollController> scrollControllers = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];

  ///_pageController is initialized to 0
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  Widget build(BuildContext context) {
    return CustomBottomDrawer(
      scrollControllers: scrollControllers,
      pageController: _pageController,
      cornerRadius: 20,
      header: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 25),
        child: Container(
          height: 2,
          width: 45,
          color: Colors.black,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.black,
                tabs: [
                  ///Names of the three tabs displayed on the screen
                  Tab(text: 'Overview', key: ValueKey('overview tab'),),
                  Tab(text: 'Features', key: ValueKey('features tab'),),
                  Tab(text: 'Miscellaneous', key: ValueKey('miscellaneous tab'), ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  90, //height of TabBarView
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  ///Contents of the tabs displayed on the screen
                  DetailOverview(
                      controller: scrollControllers[0], animal: widget.animal),
                  DetailFeatures(
                      controller: scrollControllers[1], animal: widget.animal),
                  DetailMiscellaneous(
                    controller: scrollControllers[2],
                    animal: widget.animal,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      headerHeight: MediaQuery.of(context).size.height * 0.6 +
          20 -
          MediaQuery.of(context).viewPadding.top,
      drawerHeight: MediaQuery.of(context).size.height,
      color: Colors.white,
      controller: controller,
    );
  }
}
