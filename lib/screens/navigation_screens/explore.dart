import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/models/budget_model.dart';
import 'package:find_a_place/models/map_property.dart';
import 'package:find_a_place/models/sale_home_tile.dart';
import 'package:find_a_place/models/tab_button1.dart';
import 'package:find_a_place/widgets/homepage_newhome_listing.dart';
import 'package:find_a_place/widgets/open_visit_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<TabButton1> tabButtons = [
    TabButton1('All', 1, true),
    TabButton1('Buy', 2, false),
    TabButton1('Rent', 3, false),
  ];

  List<BudgetModel> propertyBudget = [
    BudgetModel(1, '1 lakh', '3 lakh'),
    BudgetModel(2, '3 lakh', '5 lakh'),
    BudgetModel(3, '5 lakh', '10 lakh'),
    BudgetModel(4, '10 lakh', '30 lakh'),
    BudgetModel(5, '30 lakh', '50 lakh'),
  ];

  List<MapPropertyModel> propertyOnMap = [
    MapPropertyModel(1, 'Jawahar Nagar', 80, '3 lakh', '8.5 lakh'),
    MapPropertyModel(2, 'Urban Estate', 37, '6 lakh', '23 lakh'),
    MapPropertyModel(3, 'Dogran Mohalla', 108, '4 lakh', '17 lakh'),
    MapPropertyModel(4, 'Bank colony', 21, '5.9 lakh', '29 lakh'),
  ];

  @override
  Widget build(BuildContext context) {
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    final houseSaleList =
        Provider.of<ForSaleProvider>(context).houseForSaleList;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              HomePageNewListing(houseSaleList: houseSaleList),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      houseSaleList
                              .where((element) => element.isOpenVisit)
                              .toList()
                              .length
                              .toString() +
                          ' Open for visit',
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
              OpenVisitCarouselSlider(houseSaleList: houseSaleList),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Budget Homes',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              _budgetCardList(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Explore the Neighborhood',
                      style: TextStyle(
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
                height: 200,
                child: _buildNeighbourList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildNeighbourList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: propertyOnMap.length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          margin: const EdgeInsets.all(5),
          height: 200,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kwhiteColor,
              boxShadow: const [
                BoxShadow(
                    color: kdarkgreyColor, blurRadius: 5, offset: Offset(3, 2))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 180,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      'assets/map.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [kredColor, klightgreyColor])),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Icon(
                        Icons.navigation_rounded,
                        size: 20,
                        color: kwhiteColor,
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                height: 85,
                width: 180,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertyOnMap[i].areaName,
                      style: const TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          propertyOnMap[i].homeCount.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          ' Home for Sale',
                          style: TextStyle(
                              fontSize: 16,
                              color: kdarkgreyColor,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                          text: 'Buy    ',
                          style: const TextStyle(
                              fontSize: 16,
                              color: kdarkgreyColor,
                              fontWeight: FontWeight.w300),
                          children: [
                            TextSpan(
                              text: '\u{20B9}' +
                                  propertyOnMap[i].startPrice.toString() +
                                  ' - \u{20B9}' +
                                  propertyOnMap[i].endPrice.toString(),
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  SizedBox _budgetCardList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: propertyBudget.length,
        itemBuilder: (BuildContext context, int i) {
          return BouncingWidget(
            onPressed: () {},
            duration: const Duration(milliseconds: 200),
            scaleFactor: 1.5,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: kwhiteColor, width: 1.2),
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: kdarkgreyColor,
                    )
                  ]),
              child: Text(
                  propertyBudget[i].priceFrom +
                      '\nTo\n' +
                      propertyBudget[i].priceTo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kwhiteColor)),
            ),
          );
        },
      ),
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
