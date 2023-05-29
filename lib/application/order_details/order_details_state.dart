part of 'order_details_bloc.dart';

class OrderDetailsState {
  List<dynamic> orderedProducts;
  bool isLoading;
  OrderDetailsState({required this.orderedProducts, required this.isLoading});
}

class OrderDetailsInitial extends OrderDetailsState {
  OrderDetailsInitial() : super(orderedProducts: [], isLoading: true);
}
