// import 'dart:math';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'product_displaying_event.dart';
part 'product_displaying_state.dart';

class ProductDisplayingBloc
    extends Bloc<ProductDisplayingEvent, ProductDisplayingState> {
  ProductDisplayingBloc() : super(ProductDisplayingInitial()) {
    on<InitializDisplay>((event, emit) async {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('category')
          .doc(event.id)
          .get();

      final productList = docSnapshot.data()?['product'] ?? [];
      // log(productList.toString());
      return emit(ProductDisplayingState(productList: productList));
    });
    on<DeletingDisplay>((event, emit) async {
      final documentReference =
          FirebaseFirestore.instance.collection('category').doc(event.id);
      final documentSnapshot = await documentReference.get();
      final List<dynamic> products = documentSnapshot.get('product');

      if (event.index >= 0) {
        products.removeAt(event.index);
        await documentReference.update({'product': products});
      }
      return emit(ProductDisplayingState(productList: products));
    });
  }
}
