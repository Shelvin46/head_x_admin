import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:head_x_admin/application/product_detail/product_detail_bloc.dart';
// import 'package:head_x_admin/presentation/product_detail/product_detail.dart';

import '../../../main.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key, required this.context, required this.state});

  final BuildContext context;
  final ProductDetailState state;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemBuilder: (context, index, realIndex) {
          final eachValue = state.values[index];

          return buildImage(eachValue, index);
        },
        itemCount: state.values.length,
        options: CarouselOptions(
            pageSnapping: false,
            enableInfiniteScroll: false,
            height: 500,
            // autoPlay: true,
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
            image: NetworkImage(image.toString()),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
