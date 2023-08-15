import 'package:flutter/material.dart';
String uri = 'http://localhost:80';
class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      // Color.fromARGB(255, 149, 117, 205),
      // Color.fromARGB(255, 178, 124, 201),
      // Color.fromRGBO(143, 148, 251, 1),
      // Color.fromRGBO(143, 148, 251, .6),
      
      Color.fromRGBO(118, 75, 162, 1),
      Color.fromRGBO(117, 133, 203, 1),

    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 187, 158, 200); 
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static const selectedNavBarColor = Colors.blue;
  static const unselectedNavBarColor = Colors.black87;
  static var extra = Colors.deepPurple[300]!;
  static const List<String> carouselImages = [
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}