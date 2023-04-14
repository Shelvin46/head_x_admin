// import 'dart:math';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<ShowDetails>((event, emit) async {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('category')
          .doc(event.id)
          .get();

      final productList = docSnapshot.data()?['product'] ?? [];
      final productDetails = productList[event.index];
      final imageList = productDetails['images'];

      return emit(ProductDetailState(values: imageList));
    });
    on<DeleteEachPhoto>((event, emit) async {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('category')
          .doc(event.id)
          .get();

      final productList = docSnapshot.data()?['product'] ?? [];
      final productDetails = productList[event.index];
      final imageList = productDetails['images'];
      imageList.removeAt(event.imageIndex);
      await FirebaseFirestore.instance
          .collection('category')
          .doc(event.id)
          .update({'product': productList});

      return emit(ProductDetailState(values: imageList));
    });
  }
}
