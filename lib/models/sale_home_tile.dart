import 'package:find_a_place/commons/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SaleHomeTile {
  String image;
  bool isfvt;
  bool isNew;
  bool isOpenVisit;
  String price;
  String address;
  int beds;
  String fromTime;
  String endTime;
  int baths;
  double plotArea;
  String desc;
  List<LocationFacility> facility;
  SaleHomeTile(
      this.image,
      this.isfvt,
      this.isNew,
      this.price,
      this.address,
      this.beds,
      this.baths,
      this.plotArea,
      this.isOpenVisit,
      this.fromTime,
      this.endTime,
      this.facility,
      this.desc);
}

class LocationFacility {
  IconData icon;
  String facility;
  LocationFacility(this.icon, this.facility);
}

class ForSaleProvider extends ChangeNotifier {
  List<SaleHomeTile> houseForSaleList = [
    SaleHomeTile(
        house1Image,
        false,
        true,
        '8,00,000',
        'Red Square Market, Hisar',
        3,
        2,
        980,
        false,
        '',
        '',
        [
          LocationFacility(FontAwesomeIcons.bell, 'Police'),
          LocationFacility(FontAwesomeIcons.school, 'School'),
          LocationFacility(FontAwesomeIcons.bus, 'Bus Stop'),
          LocationFacility(FontAwesomeIcons.parking, 'Parking'),
          LocationFacility(FontAwesomeIcons.car, 'Transport'),
        ],
        'Very close to hisar international( ) airport, bus stand, railway station, hospital and large o. P. Jindal park, hisar. All necessary and municipal facilities are available in this approved colony. All documents (Registery, intkal) are available.'),
    SaleHomeTile(
        house2Image,
        false,
        true,
        '10,00,000',
        'Near Jindal Factry, labour Colony, Hisar',
        4,
        3,
        1180,
        false,
        '',
        '',
        [
          LocationFacility(FontAwesomeIcons.bell, 'Police'),
          LocationFacility(FontAwesomeIcons.ambulance, 'hospital'),
          LocationFacility(FontAwesomeIcons.bus, 'Bus Stop'),
          LocationFacility(FontAwesomeIcons.parking, 'Parking'),
          LocationFacility(FontAwesomeIcons.car, 'Transport'),
          LocationFacility(FontAwesomeIcons.beer, 'Bar'),
        ],
        't is a corner plot with 20 feet road on both sides. Property is located in model town extension, hissar. It is north-East facing plot situated in prime location in f block in model town.'),
    SaleHomeTile(
        house3Image,
        false,
        false,
        '7,00,000',
        'Rajiv Nagar, Gali No 4, Near Clinic, Hisar',
        2,
        1,
        750,
        false,
        '',
        '',
        [
          LocationFacility(FontAwesomeIcons.ambulance, 'hospital'),
          LocationFacility(FontAwesomeIcons.parking, 'Parking'),
          LocationFacility(FontAwesomeIcons.car, 'Transport'),
          LocationFacility(FontAwesomeIcons.beer, 'Bar'),
        ],
        'This sector is nearer to hisar airport , city , upcoming bus stand , adjoining national highway nh-10'),
    SaleHomeTile(
        house4Image,
        false,
        true,
        '9,80,000',
        'Mahabir Colony, Near RamLeela Ground, Hisar',
        4,
        4,
        1260,
        true,
        '1:00PM',
        '3:00PM',
        [
          LocationFacility(FontAwesomeIcons.bell, 'Police'),
          LocationFacility(FontAwesomeIcons.bus, 'Bus Stop'),
          LocationFacility(FontAwesomeIcons.parking, 'Parking'),
          LocationFacility(FontAwesomeIcons.car, 'Transport'),
        ],
        'Prime located corner residential plot in huda sector with swanky masions all around'),
    SaleHomeTile(
        house4Image,
        false,
        false,
        '6,70,000',
        'Aggarwal Colony, Near Chandu Pan bhandar, Hisar',
        3,
        1,
        990,
        false,
        '',
        '',
        [
          LocationFacility(FontAwesomeIcons.ambulance, 'hospital'),
          LocationFacility(FontAwesomeIcons.parking, 'Parking'),
          LocationFacility(FontAwesomeIcons.car, 'Transport'),
        ],
        'Prime location on b road of sector -3 hussar. Just near the main road and near the largest park of the area. Near holy child senior secondary school and aarogya hospital.'),
    SaleHomeTile(
        house1Image,
        false,
        true,
        '5,90,000',
        'Shiv colony, Near soap factory, Gali no 3, Hisar',
        2,
        2,
        690,
        true,
        '10:00AM',
        '2:00PM',
        [
          LocationFacility(FontAwesomeIcons.bell, 'Police'),
          LocationFacility(FontAwesomeIcons.school, 'School'),
          LocationFacility(FontAwesomeIcons.parking, 'Parking'),
          LocationFacility(FontAwesomeIcons.car, 'Transport'),
        ],
        'Beautiful plot in huda sector 5, hisar. Defence officer owned. Easy approach to hisar - Delhi highway. Less than 5 kms away from hisar airport and hisar cantt. Safe and secure sector. City amenities very close by.')
  ];
}
