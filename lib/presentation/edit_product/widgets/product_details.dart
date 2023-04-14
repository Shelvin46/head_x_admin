import 'package:flutter/material.dart';
// import 'package:head_x_admin/presentation/adding_products/main_adding.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.modelNameController,
    required this.colorTytpeController,
    required this.lengthController,
    required this.descrptionController,
  });

  final TextEditingController modelNameController;
  final TextEditingController colorTytpeController;
  final TextEditingController descrptionController;
  final TextEditingController lengthController;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: [
              Text(
                " Name:",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                  child: TextFormField(
                    controller: modelNameController,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: [
              Text(
                " Color:",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                  child: TextFormField(
                    controller: colorTytpeController,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: [
              Text(
                " Length:",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                  child: TextFormField(
                    controller: lengthController,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: [
              Text(
                "Description:",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                  child: TextFormField(
                    controller: descrptionController,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
