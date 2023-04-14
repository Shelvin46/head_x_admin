// import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'description_detail_event.dart';
part 'description_detail_state.dart';

class DescriptionDetailBloc
    extends Bloc<DescriptionDetailEvent, DescriptionDetailState> {
  DescriptionDetailBloc() : super(DescriptionDetailInitial()) {
    on<DescriptionDetail>((event, emit) async {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('category')
          .doc(event.id)
          .get();
      final productList = docSnapshot.data()?['product'] ?? [];
      return emit(DescriptionDetailState(values: productList));
    });
  }
}
