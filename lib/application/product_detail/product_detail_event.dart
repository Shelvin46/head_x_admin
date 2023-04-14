part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class ShowDetails extends ProductDetailEvent {
  String id;
  int index;
  ShowDetails({required this.id, required this.index});
}

class DeleteEachPhoto extends ProductDetailEvent {
  int index;
  String id;
  int imageIndex;
  DeleteEachPhoto({required this.id, required this.index,required this.imageIndex});
}
