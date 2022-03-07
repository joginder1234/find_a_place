import 'package:find_a_place/commons/colors.dart';
import 'package:find_a_place/models/sale_home_tile.dart';
import 'package:find_a_place/widgets/homepage_newhome_listing.dart';
import 'package:find_a_place/widgets/image_preview.dart';
import 'package:find_a_place/widgets/loading.dart';
import 'package:find_a_place/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailsScreen extends StatefulWidget {
  SaleHomeTile homeDetails;
  PropertyDetailsScreen({Key? key, required this.homeDetails})
      : super(key: key);

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  bool _loading = false;
  bool _showRequestSentDialog = false;
  bool _hasCallSupport = false;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+91' + phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final houseSaleList =
        Provider.of<ForSaleProvider>(context).houseForSaleList;
    List<String> homeFacility = [
      'Single Home Family',
      'Plot Size: ${widget.homeDetails.plotArea} sqft',
      'Built in 1993',
      'Stories: 1',
      '2 km from Bus Stand',
      '24 hour Electricity'
    ];
    double fheight = MediaQuery.of(context).size.height;
    double fwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: fheight,
        width: fwidth,
        child: Stack(
          children: [
            SizedBox(
              height: fwidth * 0.9,
              width: fwidth,
              child: Image.network(
                widget.homeDetails.image,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
                child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: fwidth * 0.8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: kwhiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.homeDetails.facility
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 70,
                                              width: 70,
                                              decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff219F94),
                                                        Color(0xffC1DEAE)
                                                      ]),
                                                  color: klightredColor,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                e.icon,
                                                color: kwhiteColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              e.facility,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildSection('HOME DETAILS'),
                                Wrap(
                                  spacing: 15,
                                  direction: Axis.horizontal,
                                  children: [
                                    _facilityBar(
                                        widget.homeDetails.beds.toString() +
                                            ' Bed',
                                        FontAwesomeIcons.bed),
                                    _facilityBar(
                                        widget.homeDetails.baths.toString() +
                                            ' Bath',
                                        FontAwesomeIcons.bath),
                                    _facilityBar(
                                        widget.homeDetails.plotArea
                                                .toStringAsFixed(0) +
                                            ' sqft',
                                        FontAwesomeIcons.rulerHorizontal),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.homeDetails.desc,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 100,
                                  child: _ImageGalary_Slider(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                _Add_to_Fav_Banner(),
                                _buildSection('HOME FEATURES'),
                                Wrap(
                                  spacing: 15,
                                  runSpacing: 10,
                                  direction: Axis.horizontal,
                                  children: homeFacility
                                      .map((e) => SizedBox(
                                            width: fwidth * 0.4,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 7,
                                                  width: 7,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.black,
                                                          shape:
                                                              BoxShape.circle),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: (fwidth * 0.4) - 20,
                                                  child: Text(
                                                    e,
                                                    style: const TextStyle(
                                                        fontSize: 17),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                _buildSection('POSTED BY'),
                                _Posted_By_Tile('Ram Kumar', '8901111444'),
                                _buildSection('MORE PROPERTIES BY OWNER'),
                                HomePageNewListing(
                                    houseSaleList: houseSaleList),
                                _buildSection('REVIEWS & RATINGS'),
                                Container(
                                    width: fwidth,
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.lightGreen,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.thumb_up_alt,
                                          color: kwhiteColor,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: fwidth - 100,
                                          child: Text(
                                            widget.homeDetails.address,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.amber.shade50,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: const [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                '4.2',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                '/5',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: kdarkgreyColor),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Ratings',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Based on\n7 ratings',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: kdarkgreyColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: fwidth - 155,
                                      child: Wrap(
                                        spacing: 20,
                                        runSpacing: 15,
                                        children: [
                                          _buildRatingSection(
                                              3.5, 'Environment'),
                                          _buildRatingSection(4.1, 'Parking'),
                                          _buildRatingSection(3.0, 'Market'),
                                          _buildRatingSection(
                                              4.8, 'Public Transport'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                _priceCard(fwidth)
              ],
            )),
            _loading ? const CustomLoading() : const SizedBox(),
            _showRequestSentDialog
                ? SuccessDialog(onPressFunction: () {
                    setState(() {
                      _showRequestSentDialog = false;
                    });
                  })
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  ListTile _Posted_By_Tile(String name, String phone) {
    return ListTile(
      title: const Text(
        'Owner',
        style: TextStyle(fontSize: 18, color: kdarkgreyColor),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            '+91-' + phone,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ],
      ),
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/dp.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing: IconButton(
          onPressed: () {
            _makePhoneCall(phone);
          },
          icon: const Icon(
            Icons.phone,
            color: kredColor,
          )),
    );
  }

  Container _Add_to_Fav_Banner() {
    return Container(
      decoration: BoxDecoration(
          color: kwhiteColor,
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kdarkgreyColor, width: 1.2)),
      child: ListTile(
        tileColor: kwhiteColor,
        leading: Image.asset(
          'assets/icons/fvt_icon.jpg',
          width: 30,
        ),
        title: const Text(
          'Add to Favorite',
          style: TextStyle(
              fontSize: 20, color: kredColor, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Save this property if don\'t want to share your details',
          style: TextStyle(fontSize: 14, color: kdarkgreyColor),
        ),
        trailing: FlatButton(
            color: kredColor,
            onPressed: () {},
            child: const Text(
              'SAVE',
              style: TextStyle(
                color: kwhiteColor,
                fontSize: 18,
              ),
            )),
      ),
    );
  }

  ListView _ImageGalary_Slider() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ImagePreviewScreen(
                    allImages: List.generate(
                        6, (index) => widget.homeDetails.image))));
          },
          child: Container(
              margin: const EdgeInsets.all(3),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 120,
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.homeDetails.image,
                  fit: BoxFit.cover,
                ),
              )),
        );
      },
    );
  }

  Column _buildRatingSection(double rating, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: kdarkgreyColor),
        ),
        RatingBar.builder(
          itemSize: 20,
          ignoreGestures: true,
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        )
      ],
    );
  }

  Column _buildSection(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1.2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  // Price card and information card
  // shown on top of the page
  // User can request information and get direction
  // of the property shown on page

  Column _priceCard(double fwidth) {
    return Column(
      children: [
        SizedBox(
          height:
              widget.homeDetails.isOpenVisit ? fwidth * 0.55 : fwidth * 0.58,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          width: fwidth,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: kwhiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(5, 3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\u{20B9} ' + widget.homeDetails.price,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [kredColor, klightredColor])),
                    child: const Text(
                      'FOR SALE',
                      style: TextStyle(
                          color: kwhiteColor, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.homeDetails.address,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18,
                    color: kdarkgreyColor,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              widget.homeDetails.isOpenVisit
                  ? Row(
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
                              widget.homeDetails.fromTime +
                              ' - ' +
                              widget.homeDetails.endTime,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showInfoDialog(() {
                        setState(() {
                          _loading = true;
                        });
                        Future.delayed(const Duration(milliseconds: 2500), () {
                          setState(() {
                            _loading = false;
                            _showRequestSentDialog = true;
                          });
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                              colors: [kredColor, klightredColor])),
                      child: const Text(
                        'Request info',
                        style: TextStyle(
                            fontSize: 18,
                            color: kwhiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                            colors: [kredColor, klightredColor])),
                    child: const Icon(
                      Icons.navigation,
                      size: 22,
                      color: kwhiteColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  // Dialog to show form //
  // that will help to get more information
  // for showing property
  Future<dynamic> _showInfoDialog(Function shoProgress) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(10),
            title: const Text('Fill the form below'),
            children: [
              const Divider(
                thickness: 1.2,
              ),
              const Text(
                'Name',
                style: TextStyle(fontSize: 16, color: kdarkgreyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.blue.shade50,
                    filled: true,
                    hintText: 'Your Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Email Address',
                style: TextStyle(fontSize: 16, color: kdarkgreyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.blue.shade50,
                    filled: true,
                    hintText: 'name@email.com',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Comments',
                style: TextStyle(fontSize: 16, color: kdarkgreyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                    fillColor: Colors.blue.shade50,
                    filled: true,
                    hintText: 'xxxxxxxxxxx......',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      color: kPrimaryColor,
                      onPressed: () {
                        shoProgress();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ],
              )
            ],
          );
        },
      ),
    );
  }

  // House BHK and Carpet area Information Bar //

  Row _facilityBar(String beds, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 20,
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
}
