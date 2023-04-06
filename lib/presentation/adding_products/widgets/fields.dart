import 'package:flutter/material.dart';
// import 'package:head_x_admin/presentation/adding_products/widgets/first_container.dart';
import '../../../core/ui_colors.dart';
import '../../../core/ui_widgets.dart';
import '../../../main.dart';
import '../main_adding.dart';

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
            controller: pnameController,
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
            controller: typeController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Headphone Type",
                labelStyle: labelColor),
          ),
        ),
        // loginPageGap2,
        loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            controller: colorController,
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
            controller: quandityController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "  Quandity",
                labelStyle: labelColor),
          ),
        ),
        loginPageGap2,

        // loginPageGap2,
        Container(
          height: myMediaQueryData.size.height * 0.07,
          width: myMediaQueryData.size.height * 0.4,
          decoration: textformRadius,
          child: TextField(
            controller: lengthController,
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
