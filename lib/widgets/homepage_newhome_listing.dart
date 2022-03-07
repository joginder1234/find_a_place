import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/models/sale_home_tile.dart';
import 'package:find_a_place/screens/gig_details.dart/property_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageNewListing extends StatefulWidget {
  List<SaleHomeTile> houseSaleList;
  HomePageNewListing({Key? key, required this.houseSaleList}) : super(key: key);

  @override
  State<HomePageNewListing> createState() => _HomePageNewListingState();
}

class _HomePageNewListingState extends State<HomePageNewListing> {
  @override
  Widget build(BuildContext context) {
    double fwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 250,
      width: fwidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.houseSaleList.length,
        itemBuilder: (BuildContext context, int i) {
          return _listing_Tile(i);
        },
      ),
    );
  }

  GestureDetector _listing_Tile(int i) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PropertyDetailsScreen(
                homeDetails: widget.houseSaleList[i],
              ))),
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 7),
        width: 180,
        decoration: BoxDecoration(
            color: kwhiteColor,
            boxShadow: const [
              BoxShadow(
                  color: klightgreyColor, blurRadius: 5, offset: Offset(4, 2))
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
                    widget.houseSaleList[i].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.houseSaleList[i].isNew
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: kredColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Text(
                                    'New',
                                    style: TextStyle(color: kwhiteColor),
                                  ),
                                )
                              : const SizedBox(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                color: kwhiteColor,
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\u{20B9} ' + widget.houseSaleList[i].price,
                    style: const TextStyle(
                        fontSize: 20,
                        color: kredColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.houseSaleList[i].address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15,
                        color: kdarkgreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 10,
                    direction: Axis.horizontal,
                    children: [
                      _facilityBar(widget.houseSaleList[i].beds.toString(),
                          FontAwesomeIcons.bed),
                      _facilityBar(widget.houseSaleList[i].baths.toString(),
                          FontAwesomeIcons.bath),
                      _facilityBar(
                          widget.houseSaleList[i].plotArea.toStringAsFixed(0) +
                              'ft',
                          FontAwesomeIcons.rulerHorizontal),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _facilityBar(String beds, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 13,
          color: Colors.grey.shade400,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          beds,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}
