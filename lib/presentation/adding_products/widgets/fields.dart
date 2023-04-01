import 'package:flutter/material.dart';
import '../../../core/ui_colors.dart';
import '../../../core/ui_widgets.dart';
import '../../../main.dart';

class AddingTextFields extends StatelessWidget {
  const AddingTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
        child: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Product name",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Headphone Type",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Headphone Driver Units",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Color",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  With Microphone",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Model name",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Length",
                labelStyle: labelColor),
          ),
        ),
      ]),
    ));
  }
}
