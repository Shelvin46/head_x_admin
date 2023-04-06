import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    List<XFile> _images = [];
    on<ImagePicking>((event, emit) async {
      XFile? result = await takePhoto(ImageSource.gallery);
      _images.add(result!);
      return emit(ImagePickerState(image: _images));
    });
    on<ClearingImage>((event, emit) async {
      _images.clear();
      return emit(ImagePickerState(image: []));
    });
  }
}

Future<XFile?> takePhoto(ImageSource src) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: src);
  var imagefile = pickedFile;
  return imagefile;
}
