import 'package:flutter/material.dart';

class PriceUpdate extends StatelessWidget {
  const PriceUpdate({
    super.key,
    required this.priceController,
  });

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 210, 0),
              child: TextFormField(
                controller: priceController,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Update",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}