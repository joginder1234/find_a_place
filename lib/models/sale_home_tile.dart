import 'package:find_a_place/commons/strings.dart';
import 'package:flutter/cupertino.dart';

class SaleHomeTile {
  String image;
  bool isfvt;
  bool isNew;
  String price;
  String address;
  int beds;
  int baths;
  double plotArea;
  SaleHomeTile(this.image, this.isfvt, this.isNew, this.price, this.address,
      this.beds, this.baths, this.plotArea);
}

class ForSaleProvider extends ChangeNotifier {
  List<SaleHomeTile> houseForSaleList = [
    SaleHomeTile(house1Image, false, true, '8,00,000',
        'Red Square Market, Hisar', 3, 2, 980),
    SaleHomeTile(house2Image, false, true, '10,00,000',
        'Near Jindal Factry, labour Colony, Hisar', 4, 3, 1180),
    SaleHomeTile(house3Image, false, false, '7,00,000',
        'Rajiv Nagar, Gali No 4, Near Clinic, Hisar', 2, 1, 750),
    SaleHomeTile(house4Image, false, true, '9,80,000',
        'Mahabir Colony, Near RamLeela Ground, Hisar', 4, 4, 1260),
    SaleHomeTile(house4Image, false, false, '6,70,000',
        'Aggarwal Colony, Near Chandu Pan bhandar, Hisar', 3, 1, 990),
    SaleHomeTile(house1Image, false, true, '5,90,000',
        'Shiv colony, Near soap factory, Gali no 3, Hisar', 2, 2, 690)
  ];
}
