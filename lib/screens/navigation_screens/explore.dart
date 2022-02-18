import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/models/sale_home_tile.dart';
import 'package:find_a_place/models/tab_button1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<TabButton1> tabButtons = [
    TabButton1('Buy', 1, true),
    TabButton1('Rent', 2, false),
    TabButton1('Sold', 3, false),
  ];
  @override
  Widget build(BuildContext context) {
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    final houseSaleList =
        Provider.of<ForSaleProvider>(context).houseForSaleList;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            width: fwidth,
            height: fwidth * 0.6,
            child: Stack(fit: StackFit.expand, children: [
              Container(
                height: fwidth * 0.6,
                margin: const EdgeInsets.only(bottom: 20),
                child: Stack(fit: StackFit.expand, children: [
                  Image.asset(
                    'assets/demo_pro.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54])),
                  )
                ]),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: kwhiteColor,
                      ),
                      Text(
                        'Hisar (Haryana)',
                        style: TextStyle(fontSize: 18, color: kwhiteColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: klightgreyColor,
                        blurRadius: 8,
                        offset: Offset(4, 2))
                  ]),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        fillColor: kwhiteColor,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: kdarkgreyColor),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: klightgreyColor,
                        ),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.slidersH,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ])
            ]),
          ),
          _sectionTabBar(fwidth),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  houseSaleList
                          .where((element) => element.isNew)
                          .toList()
                          .length
                          .toString() +
                      ' New Listing',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View all',
                      style: TextStyle(fontSize: 16, color: kredColor),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 240,
            width: fwidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: houseSaleList.length,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 7),
                  width: 180,
                  decoration: BoxDecoration(
                      color: kwhiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: klightgreyColor,
                            blurRadius: 5,
                            offset: Offset(4, 2))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 120,
                        child: Stack(fit: StackFit.expand, children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                              houseSaleList[i].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          houseSaleList[i].isNew
                              ? Container(
                                  child: Text('New'),
                                )
                              : SizedBox()
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\u{20B9} ' + houseSaleList[i].price,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: kredColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              houseSaleList[i].address,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: kdarkgreyColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Wrap(
                              spacing: 15,
                              direction: Axis.horizontal,
                              children: [
                                _facilityBar(houseSaleList[i].beds.toString(),
                                    FontAwesomeIcons.bed),
                                _facilityBar(houseSaleList[i].baths.toString(),
                                    FontAwesomeIcons.bath),
                                _facilityBar(
                                    houseSaleList[i]
                                        .plotArea
                                        .toStringAsFixed(0),
                                    FontAwesomeIcons.rulerHorizontal),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _facilityBar(String beds, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 15,
          color: Colors.grey.shade400,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          beds,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }

  Padding _sectionTabBar(double fwidth) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: fwidth,
          height: 50,
          child: Row(
              children: tabButtons
                  .map((e) => Expanded(
                        flex: 3,
                        child: BouncingWidget(
                            duration: const Duration(milliseconds: 70),
                            scaleFactor: 1.5,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color:
                                      e.isActive ? kPrimaryColor : kwhiteColor,
                                  border: e.isActive
                                      ? null
                                      : Border.all(
                                          color: kdarkgreyColor, width: 1),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                e.title,
                                style: TextStyle(
                                    color:
                                        e.isActive ? kwhiteColor : Colors.black,
                                    fontSize: 18),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                tabButtons
                                    .firstWhere((element) => element.id == e.id)
                                    .isActive = true;
                                tabButtons
                                    .where((element) => element.id != e.id)
                                    .forEach((element) {
                                  element.isActive = false;
                                });
                              });
                            }),
                      ))
                  .toList()),
        ));
  }
}
