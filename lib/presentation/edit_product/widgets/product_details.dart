
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.modelNameController,
    required this.headPhoneTytpeController,
    required this.driverTypeController,
    required this.microphoneController,
    required this.lengthController,
  });

  final TextEditingController modelNameController;
  final TextEditingController headPhoneTytpeController;
  final TextEditingController driverTypeController;
  final TextEditingController microphoneController;
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
                "Model Name:",
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
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
                "HeadPhone Type:",
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
                    controller: headPhoneTytpeController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
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
                "Driver Units:",
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
                    controller: driverTypeController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
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
                "Microphone:",
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
                    controller: microphoneController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
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
                "Length:",
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26),
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