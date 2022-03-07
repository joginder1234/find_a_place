import 'package:carousel_slider/carousel_slider.dart';
import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/models/sale_home_tile.dart';
import 'package:find_a_place/screens/gig_details.dart/property_details.dart';
import 'package:flutter/material.dart';

class OpenVisitCarouselSlider extends StatefulWidget {
  List<SaleHomeTile> houseSaleList;
  OpenVisitCarouselSlider({Key? key, required this.houseSaleList})
      : super(key: key);

  @override
  State<OpenVisitCarouselSlider> createState() =>
      _OpenVisitCarouselSliderState();
}

class _OpenVisitCarouselSliderState extends State<OpenVisitCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    double fwidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 1.45,
        initialPage: 2,
      ),
      items: widget.houseSaleList
          .where((element) => element.isOpenVisit)
          .toList()
          .map((e) => GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PropertyDetailsScreen(homeDetails: e))),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: fwidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kwhiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: kdarkgreyColor,
                            blurRadius: 5,
                            offset: Offset(3, 2))
                      ]),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: fwidth,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                              e.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  e.isNew
                                      ? const Chip(
                                          backgroundColor: kredColor,
                                          label: Text(
                                            'NEW',
                                            style: TextStyle(
                                                color: kwhiteColor,
                                                fontSize: 14),
                                          ))
                                      : const SizedBox(),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Chip(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      backgroundColor: kredColor,
                                      label: Text(
                                        'OPEN FOR VISIT',
                                        style: TextStyle(
                                            color: kwhiteColor, fontSize: 14),
                                      ))
                                ],
                              ),
                              Text(
                                '\u{20B9} ' + e.price,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: kredColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                e.address,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: kdarkgreyColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Open: ',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kdarkgreyColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Everyday ' +
                                        e.fromTime +
                                        ' - ' +
                                        e.endTime,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
