import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 1,
        itemBuilder: (context, index, realIndex) {
          //final listOne = listImage[index];
          return buildImage("assets/4.jpeg", index);
        },
        options: CarouselOptions(
            pageSnapping: false,
            enableInfiniteScroll: false,
            height: 500,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: 1));
  }

  Widget buildImage(String image, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: myMediaQueryData.size.width * 0.9,
        // color: Colors.green,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
