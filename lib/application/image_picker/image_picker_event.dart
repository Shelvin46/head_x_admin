part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent {}

class ImagePicking extends ImagePickerEvent {}

class ClearingImage extends ImagePickerEvent {}
 