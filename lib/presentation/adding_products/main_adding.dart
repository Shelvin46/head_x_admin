import 'dart:developer';
import 'dart:io';
// import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/image_picker/image_picker_bloc.dart';
import 'package:head_x_admin/application/product_displaying/product_displaying_bloc.dart';
// import 'package:head_x_admin/application/product_images/product_images_bloc.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/firebase/product_adding/adding.dart';
import 'package:head_x_admin/presentation/adding_products/widgets/fields.dart';
import 'package:head_x_admin/presentation/adding_products/widgets/first_container.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

final pnameController = TextEditingController();
final typeController = TextEditingController();
final colorController = TextEditingController();
final quandityController = TextEditingController();
final priceController = TextEditingController();
final lengthController = TextEditingController();

class MainAddingProduct extends StatelessWidget {
  const MainAddingProduct({
    super.key,
    required this.title,
    required this.id,
  });
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "Add Product", appbarColor: appbarColor)),
      body: SizedBox(
        height: 1000,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
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
              FirstContainer(id: id),
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
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: priceController,
                        style: addText1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 1)),
                      ),
                    ),
                    addGap3,
                  ],
                ),
              ),
              const Divider(),
              AddingTextFields(),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  // List<String> selectedImageUrls = [];

                  return InkWell(
                    onTap: () async {
                      List<File> imagesFile = [];
                      List<String> selectedImageUrls = [];
                      for (var element in state.image) {
                        imagesFile.add(File(element.path));
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        barrierDismissible: false,
                      );

                      // Upload selected images to Firebase Storage
                      for (var imageFile in imagesFile) {
                        String fileName = DateTime.now().toString();
                        Reference reference =
                            FirebaseStorage.instance.ref().child(fileName);
                        UploadTask uploadTask = reference.putFile(imageFile);
                        TaskSnapshot taskSnapshot = await uploadTask;
                        String downloadUrl =
                            await taskSnapshot.ref.getDownloadURL();
                        selectedImageUrls.add(downloadUrl);
                      }

                      DatabaseServices().addProduct(
                          images: selectedImageUrls,
                          name: pnameController.text,
                          type: typeController.text,
                          color: colorController.text,
                          length: int.parse(lengthController.text),
                          price: int.parse(priceController.text),
                          id: id,
                          quantity: int.parse(quandityController.text));
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<ProductDisplayingBloc>(context)
                          .add(InitializDisplay(id: id));
                      pnameController.clear();
                      typeController.clear();
                      colorController.clear();
                      lengthController.clear();
                      priceController.clear();
                      quandityController.clear();
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<ImagePickerBloc>(context)
                          .add(ClearingImage());
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text('Added the product'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      selectedImageUrls.clear();
                      imagesFile.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: Container(
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
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

funcction() async {
  final storage = await FirebaseStorage.instance;
}
