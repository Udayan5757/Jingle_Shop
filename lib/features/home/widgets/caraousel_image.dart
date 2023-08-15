import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jingle_shop/constants/global_variables.dart';
class CaraouselImage extends StatelessWidget {
  const CaraouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((e){
        return Builder(builder: (BuildContext context) =>
        Image.network(e,fit: BoxFit.cover,height:200,),
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}