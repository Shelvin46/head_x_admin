import 'package:flutter/material.dart';
import 'package:head_x_admin/application/product_detail/product_detail_bloc.dart';

class SubProdView extends StatelessWidget {
  const SubProdView({
    super.key,
    required this.context,
    required this.state,
  });
  final BuildContext context;
  final ProductDetailState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(state.values[index]))),

              // color: Colors.black,
            );
          },
          separatorBuilder: (context, index) {
            return const Padding(padding: EdgeInsets.all(10));
          },
          itemCount: state.values.length),
    );
  }
}
