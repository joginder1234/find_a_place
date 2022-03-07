import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/screens/navigation_screens/alerts_screen.dart';
import 'package:find_a_place/screens/navigation_screens/explore.dart';
import 'package:find_a_place/screens/navigation_screens/homepage.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentPage = 0;
  List<Widget> allScreens = [
    ExploreScreen(),
    ExploreScreen(),
    AlertsScreen(),
    ExploreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: kredColor,
        initialSelection: 0,
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.search, title: "Search"),
          TabData(iconData: Icons.notifications, title: "Alerts"),
          TabData(iconData: Icons.account_circle_sharp, title: "Account")
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      body: allScreens[currentPage],
    );
  }
}
