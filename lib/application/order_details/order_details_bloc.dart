import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsInitial()) {
    on<OrderDetails>((event, emit) async {
      List<dynamic> orderdProducts = [];
      final data = await FirebaseFirestore.instance.collection('users').get();
      for (var eachDoc in data.docs) {
        final eachData = await FirebaseFirestore.instance
            .collection('users')
            .doc(eachDoc.id)
            .get();
        for (var product in eachData.data()?['orders'] ?? []) {
          orderdProducts.add(product);
        }
      }
      return emit(
          OrderDetailsState(orderedProducts: orderdProducts, isLoading: false));
    });
  }
}
