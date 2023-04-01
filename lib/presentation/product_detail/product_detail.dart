import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/edit_product/main_edit_details.dart';
import 'package:head_x_admin/presentation/product_detail/widgets/each_product_spec.dart';
import 'package:head_x_admin/presentation/product_detail/widgets/product_view.dart';
import 'package:head_x_admin/presentation/product_detail/widgets/subprod_view.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

import '../../main.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            title: "Product Details",
            appbarColor: appbarColor,
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: myMediaQueryData.size.width * 1,
          height: myMediaQueryData.size.height * 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 500,
                // color: Colors.amber,
                child: Column(
                  children: const [
                    SliderView(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: SubProdView(),
              ),
              detailGap,
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "boAt Bassheads 100 Wired Headset\n(Black, In the Ear)",
                  style: detailText1,
                ),
              ),
              detailGap,
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "₹999",
                  style: detailText2,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text("Specifications",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              ),
              detailGap2,
              ProductSpecification(
                color: detailColor,
                text1: "Model Name:",
                text2: " RMA2016",
              ),
              detailGap2,
              ProductSpecification(
                color: detailColor,
                text1: "Headphone Type:",
                text2: " In the Ear",
              ),
              detailGap2,
              ProductSpecification(
                color: detailColor,
                text1: "Headphone Driver units:",
                text2: " 11.2mm",
              ),
              detailGap2,
              ProductSpecification(
                color: detailColor,
                text1: "With Microphone:",
                text2: " Yes",
              ),
              detailGap2,
              ProductSpecification(
                  color: detailColor, text1: "Length:", text2: " 1mm")
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        key: UniqueKey(),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MainEditDetails();
                },
              ));
            },
            child: Container(
              width: myMediaQueryData.size.width * 1,
              height: 50,
              decoration: BoxDecoration(
                  color: appbarColor,
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Center(
                  child: Text(
                "Edit Details",
                style: detailText3,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
