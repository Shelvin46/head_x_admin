import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/image_picker/image_picker_bloc.dart';
// import 'package:head_x_admin/application/product_images/product_images_bloc.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/ui_colors.dart';

XFile? result;

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  builder: (context, state) {
                    if (state.image.isEmpty) {
                      return Center(
                        child: Text(
                          'Select any image',
                        ),
                      );
                    }
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final values = state.image[index];
                        // final value = state.values[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 120,
                                width: 100,
                                //  color: Colors.amberAccent,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: FileImage(File(values.path)),
                                  fit: BoxFit.cover,
                                )),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(120, 140, 0, 0),
                                  child: Icon(
                                    Icons.delete,
                                    size: 40,
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
                      itemCount: state.image.length,
                    );
                  },
                )),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: appbarColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    BlocProvider.of<ImagePickerBloc>(context)
                        .add(ImagePicking());
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
      ),
    );
  }
}
