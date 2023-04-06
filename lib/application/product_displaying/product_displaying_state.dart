part of 'product_displaying_bloc.dart';

class ProductDisplayingState {
  List<dynamic> productList;
  ProductDisplayingState({required this.productList});
}

class ProductDisplayingInitial extends ProductDisplayingState {
  ProductDisplayingInitial() : super(productList: []);
}
