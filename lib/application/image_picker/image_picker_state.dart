part of 'image_picker_bloc.dart';

class ImagePickerState {
  final List<XFile> image;
  ImagePickerState({required this.image});
}

class ImagePickerInitial extends ImagePickerState {
  ImagePickerInitial() : super(image: []);
}
