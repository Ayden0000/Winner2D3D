import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:winner_v3_5/app/data/consts/string.dart';

class CrouselSlider extends StatelessWidget {
  const CrouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:
          StringConsts.imageList.map((imagePath) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            );
          }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
    );
  }
}
