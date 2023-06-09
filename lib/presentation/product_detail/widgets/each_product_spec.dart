import 'package:flutter/material.dart';

class ProductSpecification extends StatelessWidget {
  ProductSpecification(
      {super.key,
      required this.color,
      required this.text1,
      required this.text2});
  Color color;
  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            text1,
            style: TextStyle(
              color: Color.fromARGB(255, 92, 90, 90),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text2,
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        )
      ],
    );
  }
}
