import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/adding_products/widgets/fields.dart';
import 'package:head_x_admin/presentation/adding_products/widgets/first_container.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

class MainAddingProduct extends StatelessWidget {
  const MainAddingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: "Add Product", appbarColor: appbarColor)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addGap1,
          Padding(
            padding: addGap2,
            child: Text(
              "Add Photos",
              style: addText1,
            ),
          ),
          const Divider(),
          const FirstContainer(),
          const Divider(),
          Padding(
            padding: addGap2,
            child: Row(
              children: [
                Text(
                  "Add Product Price",
                  style: addText1,
                ),
                const Spacer(),
                Text(
                  "₹999",
                  style: addText1,
                ),
                addGap3,
              ],
            ),
          ),
          const Divider(),
          const Expanded(
            child: AddingTextFields(),
          )
        ],
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        color: appbarColor,
        child: Center(
          child: Text(
            "Save",
            style: addText4,
          ),
        ),
      ),
    );
  }
}
