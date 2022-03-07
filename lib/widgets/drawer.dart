// ignore_for_file: deprecated_member_use

import 'package:find_a_place/commons/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomDrawer extends StatefulWidget {
  MyCustomDrawer({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<MyCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    double framHeight = MediaQuery.of(context).size.height;
    double framWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          border: Border.all(color: kwhiteColor, width: 1.2),
                          shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          'assets/dp.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: framWidth * 0.45,
                          child: const Text(
                            'Joginder Saini',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: kwhiteColor),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: framWidth * 0.45,
                          child: const Text(
                            'digisolutions.hsr@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: klightgreyColor),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: framHeight,
            width: framWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  children: [
                    _buildDrawerButton(FontAwesomeIcons.home, 'Home'),
                    _buildDrawerButton(FontAwesomeIcons.search, 'Search'),
                    _buildDrawerButton(FontAwesomeIcons.fileDownload, 'Saved'),
                    _buildDrawerButton(FontAwesomeIcons.bell, 'My Alerts'),
                    _buildDrawerButton(FontAwesomeIcons.user, 'Profile'),
                    _buildDrawerButton(FontAwesomeIcons.slidersH, 'Setting'),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    color: kwhiteColor,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/logout.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Log Out',
                            style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ],
      ),
    );
  }

  FlatButton _buildDrawerButton(IconData path, String title) {
    return FlatButton.icon(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        onPressed: () {},
        icon: Icon(
          path,
          color: kwhiteColor,
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: GoogleFonts.nunito(fontSize: 18, color: kwhiteColor),
            ),
          ],
        ));
  }
}
