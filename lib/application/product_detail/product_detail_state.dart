part of 'product_detail_bloc.dart';

class ProductDetailState {
  Widget? progressBar;
  List<dynamic> values;
  ProductDetailState({required this.values, this.progressBar});
}

class ProductDetailInitial extends ProductDetailState {
  ProductDetailInitial()
      : super(progressBar: const CircularProgressIndicator(), values: []);
}
