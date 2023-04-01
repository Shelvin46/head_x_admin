import 'package:flutter/material.dart';

class SubProdView extends StatelessWidget {
  const SubProdView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              color: Colors.amber,

              // color: Colors.black,
            );
          },
          separatorBuilder: (context, index) {
            return const Padding(padding: EdgeInsets.all(10));
          },
          itemCount: 5),
    );
  }
}
