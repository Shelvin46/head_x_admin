import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/description_detail/description_detail_bloc.dart';
import 'package:head_x_admin/application/product_detail/product_detail_bloc.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/firebase/product_update/update.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/edit_photos.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/price_update.dart';
import 'package:head_x_admin/presentation/edit_product/widgets/product_details.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

import '../../application/product_displaying/product_displaying_bloc.dart';

class MainEditDetails extends StatelessWidget {
  MainEditDetails({super.key, required this.id, required this.index});
  var priceController = TextEditingController();
  final modelNameController = TextEditingController();
  final colorTytpeController = TextEditingController();
  final descriptionController = TextEditingController();

  final lengthController = TextEditingController();
  final String id;
  final int index;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductDetailBloc>(context)
          .add(ShowDetails(id: id, index: index));
      BlocProvider.of<DescriptionDetailBloc>(context)
          .add(DescriptionDetail(id: id, index: index));
    });

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
          BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return EditPhotos(
                context: context,
                state: state,
                id: id,
                index1: index,
              );
            },
          ),
          editGap1,
          Padding(
            padding: editGap2,
            child: Text(
              "Edit Product Price",
              style: editText1,
            ),
          ),
          const Divider(),
          BlocBuilder<DescriptionDetailBloc, DescriptionDetailState>(
            builder: (context, state) {
              log(priceController.text);
              int price = state.values[index]['price'];
              priceController.text = price.toString();
              return PriceUpdate(priceController: priceController);
            },
          ),
          const Divider(),
          Padding(
            padding: editGap2,
            child: Text(
              "Edit Product Details",
              style: editText1,
            ),
          ),
          const Divider(),
          BlocBuilder<DescriptionDetailBloc, DescriptionDetailState>(
            builder: (context, state) {
              modelNameController.text = state.values[index]['name'];
              colorTytpeController.text = state.values[index]['color'];
              int length = state.values[index]['lenght'];
              lengthController.text = length.toString();
              descriptionController.text = state.values[index]['description'];
              return ProductDetails(
                modelNameController: modelNameController,
                colorTytpeController: colorTytpeController,
                lengthController: lengthController,
                descrptionController: descriptionController,
              );
            },
          ),
          editGap4,
          Center(
              child: InkWell(
            onTap: () async {
              List<String> selectedImageUrls = [];
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                barrierDismissible: false,
              );
              for (var image in imageFile) {
                String fileName = DateTime.now().toString();
                Reference reference =
                    FirebaseStorage.instance.ref().child(fileName);
                UploadTask uploadTask = reference.putFile(image);
                TaskSnapshot taskSnapshot = await uploadTask;
                String downloadUrl = await taskSnapshot.ref.getDownloadURL();

                selectedImageUrls.add(downloadUrl);
              }
              final docSnapshot = await FirebaseFirestore.instance
                  .collection('category')
                  .doc(id)
                  .get();

              final productList = docSnapshot.data()?['product'] ?? [];
              final productDetails = productList[index];
              final List<String> imageList =
                  List<String>.from(productDetails['images'] ?? []);
              imageList.addAll(selectedImageUrls);
              FirebaseUpdate().updateProduct(
                  images: imageList,
                  name: modelNameController.text,
                  type: descriptionController.text,
                  color: colorTytpeController.text,
                  length: int.parse(lengthController.text),
                  price: int.parse(priceController.text),
                  id: id,
                  index: index);
              selectedImageUrls.clear();
              imageFile.clear();

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: Text(
              "Update",
              style: editText3,
            ),
          )),
          editGap4,
          InkWell(
            onTap: () {
              BlocProvider.of<DescriptionDetailBloc>(context)
                  .add(DescriptionDetail(id: id, index: index));
              BlocProvider.of<ProductDisplayingBloc>(context)
                  .add(InitializDisplay(id: id));
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Updated Successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: appbarColor,
              child: Center(
                child: Text(
                  "Confirm",
                  style: editText2,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
