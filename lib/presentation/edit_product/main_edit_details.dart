import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/edit_photos.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/price_update.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/product_details.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

class MainEditDetails extends StatelessWidget {
  MainEditDetails({super.key});
  final priceController = TextEditingController();
  final modelNameController = TextEditingController();
  final headPhoneTytpeController = TextEditingController();
  final driverTypeController = TextEditingController();
  final microphoneController = TextEditingController();
  final lengthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    priceController.text = "₹999";
    modelNameController.text = "RMA2016";
    headPhoneTytpeController.text = "In the Ear";
    driverTypeController.text = "11.2mm";
    microphoneController.text = "Yes";
    lengthController.text = "1m";

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "Edit Details", appbarColor: appbarColor)),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          editGap1,
          Padding(
            padding: editGap2,
            child: Text(
              "Edit Photos",
              style: editText1,
            ),
          ),
          const Divider(),
          const EditPhotos(),
          editGap1,
          Padding(
            padding: editGap2,
            child: Text(
              "Edit Product Price",
              style: editText1,
            ),
          ),
          const Divider(),
          PriceUpdate(priceController: priceController),
          const Divider(),
          Padding(
            padding: editGap2,
            child: Text(
              "Edit Product Details",
              style: editText1,
            ),
          ),
          const Divider(),
          ProductDetails(
              modelNameController: modelNameController,
              headPhoneTytpeController: headPhoneTytpeController,
              driverTypeController: driverTypeController,
              microphoneController: microphoneController,
              lengthController: lengthController),
          editGap4,
          Center(
              child: Text(
            "Update",
            style: editText3,
          )),
          editGap4,
          Container(
            height: 60,
            width: double.infinity,
            color: appbarColor,
            child: Center(
              child: Text(
                "Confirm",
                style: editText2,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
