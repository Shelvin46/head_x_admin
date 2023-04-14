// import 'dart:math';

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/product_detail/product_detail_bloc.dart';
// import 'package:head_x_admin/application/update_image_picker/update_image_picker_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../application/image_picker/image_picker_bloc.dart';
import '../../../core/ui_colors.dart';
import '../../../core/ui_widgets.dart';

List<File> imageFile = [];

class EditPhotos extends StatelessWidget {
  EditPhotos(
      {super.key,
      required this.context,
      required this.state,
      required this.id,
      required this.index1});
  final BuildContext context;
  final ProductDetailState state;
  final String id;
  final int index1;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductDetailBloc>(context)
          .add(ShowDetails(id: id, index: index1));
    });
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final image = state.values;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 170,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(image[index].toString()))),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(120, 140, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<ProductDetailBloc>(context)
                                      .add(DeleteEachPhoto(
                                          id: id,
                                          index: index1,
                                          imageIndex: index));
                                },
                                child: const Icon(
                                  Icons.delete,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.all(3));
                  },
                  itemCount: state.values.length,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 70,
          color: appbarColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await updateImagesIntoFireStore(id, index1);
                  BlocProvider.of<ProductDetailBloc>(context)
                      .add(ShowDetails(id: id, index: index1));
                },
                child: Text(
                  "+ Add Photos",
                  style: editText2,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> updateImagesIntoFireStore(String id, int index) async {
    XFile? result = await takePhoto(ImageSource.gallery);

    List<XFile> updateImages = [];
    updateImages.add(result!);

    for (var image in updateImages) {
      imageFile.add(File(image.path));
      // log(updateImages.toString());
    }

    updateImages.clear();
  }
}
