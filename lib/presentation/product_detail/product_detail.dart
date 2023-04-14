// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/description_detail/description_detail_bloc.dart';
import 'package:head_x_admin/application/product_detail/product_detail_bloc.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/edit_product/main_edit_details.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/edit_photos.dart';
import 'package:head_x_admin/presentation/product_detail/widgets/each_product_spec.dart';
import 'package:head_x_admin/presentation/product_detail/widgets/product_view.dart';
import 'package:head_x_admin/presentation/product_detail/widgets/subprod_view.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

import '../../main.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.id, required this.index});
  final String id;
  final int index;

  @override
  Widget build(BuildContext context) {
    log(index.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductDetailBloc>(context)
          .add(ShowDetails(id: id, index: index));
      BlocProvider.of<DescriptionDetailBloc>(context)
          .add(DescriptionDetail(id: id, index: index));
    });
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
          height: myMediaQueryData.size.height * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 500,
                // color: Colors.amber,
                child: Column(
                  children: [
                    BlocBuilder<ProductDetailBloc, ProductDetailState>(
                      builder: (context, state) {
                        return SliderView(
                          context: context,
                          state: state,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  builder: (context, state) {
                    return SubProdView(
                      context: context,
                      state: state,
                    );
                  },
                ),
              ),
              detailGap,
              BlocBuilder<DescriptionDetailBloc, DescriptionDetailState>(
                builder: (context, state) {
                  if (state.values.isNotEmpty &&
                      index >= 0 &&
                      index < state.values.length) {
                    final value = state.values[index]['name'];
                    return Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        value.toString(),
                        style: detailText1,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              detailGap,
              BlocBuilder<DescriptionDetailBloc, DescriptionDetailState>(
                builder: (context, state) {
                  if (state.values.isNotEmpty && index < state.values.length) {
                    final text = state.values[index]['price'];
                    return Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '\u20B9$text',
                        style: detailText2,
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
                child: Text("Specifications",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              ),
              detailGap2,
              BlocBuilder<DescriptionDetailBloc, DescriptionDetailState>(
                builder: (context, state) {
                  if (state.values.isNotEmpty && index < state.values.length) {
                    return Column(children: [
                      ProductSpecification(
                        color: detailColor,
                        text1: "Color:",
                        text2: state.values[index]['color'],
                      ),
                      detailGap2,
                      ProductSpecification(
                        color: detailColor,
                        text1: "Length:",
                        text2: " 11.2mm",
                      ),
                      detailGap2,
                      ProductSpecification(
                          color: detailColor,
                          text1: "Description:",
                          text2: state.values[index]['description'])
                    ]);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
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
                  return MainEditDetails(
                    id: id,
                    index: index,
                  );
                },
              ));
              imageFile.clear();
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
