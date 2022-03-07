import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:find_a_place/bottom_nav.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/screens/navigation_screens/explore.dart';
import 'package:find_a_place/screens/navigation_screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues _currentValues = const RangeValues(400000, 800000);
  String? _myActivity;
  bool buy = false;
  bool rent = false;
  @override
  Widget build(BuildContext context) {
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BouncingWidget(
                  duration: const Duration(milliseconds: 70),
                  scaleFactor: 1.5,
                  child: _buildBottomButtons(fwidth, kwhiteColor, 'Skip', true),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => MyHomePage()));
                  },
                ),
                BouncingWidget(
                  duration: const Duration(milliseconds: 70),
                  scaleFactor: 1.5,
                  child: _buildBottomButtons(
                      fwidth, kwhiteColor, 'Search Property', false),
                  onPressed: () {},
                ),
              ],
            )),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              20, AppBar().preferredSize.height + 10, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Let get started',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Text(
                  'Find your dream home today',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kdarkgreyColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BouncingWidget(
                        duration: const Duration(milliseconds: 70),
                        scaleFactor: 1.7,
                        child: _buyHomeCard(fwidth),
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() {
                              buy = true;
                              rent = false;
                            });
                          });
                        }),
                    BouncingWidget(
                        duration: const Duration(milliseconds: 70),
                        scaleFactor: 1.7,
                        child: _rentHomeCard(fwidth),
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            setState(() {
                              buy = false;
                              rent = true;
                            });
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Where',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      fillColor: kwhiteColor,
                      filled: true,
                      hintText: 'Search Place ...',
                      hintStyle: const TextStyle(color: kdarkgreyColor),
                      prefixIcon: const Icon(
                        Icons.location_on_sharp,
                        color: klightgreyColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: klightgreyColor))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Price Range',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  _currentValues.start.toStringAsFixed(2) +
                      ' - ' +
                      _currentValues.end.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                RangeSlider(
                    activeColor: kredColor,
                    inactiveColor: Colors.red.shade100,
                    max: 1000000,
                    divisions: 10,
                    labels: RangeLabels(_currentValues.start.round().toString(),
                        _currentValues.end.round().toString()),
                    values: _currentValues,
                    onChanged: (values) {
                      setState(() {
                        _currentValues = values;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'House Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                _selectHouseDropDown()
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropDownFormField _selectHouseDropDown() {
    return DropDownFormField(
      titleText: 'Select House Type',
      hintText: '1-BHK',
      value: _myActivity,
      onSaved: (v) {
        setState(() {
          _myActivity = v;
        });
      },
      onChanged: (v) {
        setState(() {
          _myActivity = v;
        });
      },
      dataSource: const [
        {
          "display": "1-BHK",
          "value": "1-BHK",
        },
        {
          "display": "2-BHK",
          "value": "2-BHK",
        },
        {
          "display": "3-BHK",
          "value": "3-BHK",
        },
        {
          "display": "4-BHK",
          "value": "4-BHK",
        },
        {
          "display": "Banglow",
          "value": "Banglow",
        },
      ],
      textField: 'display',
      valueField: 'value',
    );
  }

  Container _rentHomeCard(double fwidth) {
    return Container(
      width: fwidth * 0.4,
      height: fwidth * 0.5,
      decoration: BoxDecoration(
          border: Border.all(color: kwhiteColor, width: 1.2),
          boxShadow: const [
            BoxShadow(
                color: klightgreyColor, blurRadius: 10, offset: Offset(5, 5))
          ],
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/home_icons/rent.png',
              width: (fwidth * 0.4) * 0.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Rent',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        rent
            ? Positioned(
                right: 10,
                top: 5,
                child: Image.asset(
                  'assets/home_icons/check.png',
                  width: 30,
                ),
              )
            : const SizedBox()
      ]),
    );
  }

  Container _buildBottomButtons(
      double fwidth, Color buttoncolor, String title, bool border) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: fwidth * 0.42,
      decoration: border
          ? BoxDecoration(
              border: Border.all(color: kredColor, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: klightgreyColor,
                  blurRadius: 10,
                  offset: Offset(5, 5),
                )
              ],
              color: buttoncolor,
              borderRadius: BorderRadius.circular(100))
          : BoxDecoration(
              boxShadow: const [
                  BoxShadow(
                    color: klightgreyColor,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  )
                ],
              gradient:
                  const LinearGradient(colors: [kredColor, klightredColor]),
              borderRadius: BorderRadius.circular(100)),
      child: Text(
        title,
        style:
            TextStyle(fontSize: 18, color: border ? Colors.black : kwhiteColor),
      ),
    );
  }

  Container _buyHomeCard(double fwidth) {
    return Container(
      width: fwidth * 0.4,
      height: fwidth * 0.5,
      decoration: BoxDecoration(
          border: Border.all(color: kwhiteColor, width: 1.2),
          boxShadow: const [
            BoxShadow(
                color: klightgreyColor, blurRadius: 10, offset: Offset(5, 5))
          ],
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/home_icons/buy.png',
              width: (fwidth * 0.4) * 0.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Buy',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        buy
            ? Positioned(
                right: 10,
                top: 5,
                child: Image.asset(
                  'assets/home_icons/check.png',
                  width: 30,
                ),
              )
            : const SizedBox()
      ]),
    );
  }
}
