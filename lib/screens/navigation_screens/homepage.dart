import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/screens/navigation_screens/home_page.dart';
import 'package:find_a_place/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double framHeight = MediaQuery.of(context).size.height;
    double framWidth = MediaQuery.of(context).size.width;
    return ZoomDrawer(
        backgroundColor: kPrimaryColor,
        style: DrawerStyle.Style1,
        angle: -7,
        slideWidth: 330,
        menuScreen: MyCustomDrawer(),
        mainScreen: HomePage());
  }
}
