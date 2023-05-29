import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/image_picker/image_picker_bloc.dart';
import 'package:head_x_admin/application/product_displaying/product_displaying_bloc.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
// import 'package:head_x_admin/firebase/product_deleting/deleting.dart';
import 'package:head_x_admin/presentation/adding_products/main_adding.dart';
import 'package:head_x_admin/presentation/product_detail/product_detail.dart';

import 'package:head_x_admin/presentation/widgets/app_bar.dart';

class MainWiredHeadphones extends StatelessWidget {
  MainWiredHeadphones({
    super.key,
    required this.title,
    required this.id,
  });
  final String title;
  final String id;

  // final int index;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductDisplayingBloc>(context)
          .add(InitializDisplay(id: id));
    });
    // log(productDetails.toString());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: title, appbarColor: appbarColor)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(67, 171, 163, 163),
        child: Column(
          children: [
            listGap1,
            Expanded(
              child: BlocBuilder<ProductDisplayingBloc, ProductDisplayingState>(
                builder: (context, state) {
                  // log(state.productList.toString());
                  if (state.productList.isEmpty) {
                    return Center(
                      child: Text("No Data"),
                    );
                  }
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final value = state.productList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductDetail(
                                id: id,
                                index: index,
                              );
                            },
                          ));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.white,
                          child: Row(
                            children: [
                              listGap2,
                              Container(
                                height: 160,
                                width: 150,
                                child: Image(
                                  image: NetworkImage(
                                    value['images'][0],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              listGap2,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  listGap3,
                                  Text(
                                    value['name'],
                                    style: productName,
                                    maxLines: 3,
                                  ),
                                  listGap4,
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(160, 50, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Confirm Deletion"),
                                            content: Text(
                                                "Are you sure you want to delete this product?"),
                                            actions: [
                                              TextButton(
                                                child: Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text("Delete"),
                                                onPressed: () {
                                                  //DeletingServices().deleteProduct(id, index);
                                                  BlocProvider.of<
                                                              ProductDisplayingBloc>(
                                                          context)
                                                      .add(
                                                    DeletingDisplay(
                                                        id: id, index: index),
                                                  );
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        size: 40,
                                        color: appbarColor,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return listGap1;
                    },
                    itemCount: state.productList.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MainAddingProduct(
                title: title,
                id: id,
              );
            },
          ));
          BlocProvider.of<ImagePickerBloc>(context).add(ClearingImage());
        },
        child: Icon(Icons.add),
        backgroundColor: appbarColor,
      ),
    );
  }
}
