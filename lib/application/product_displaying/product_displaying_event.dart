part of 'product_displaying_bloc.dart';

@immutable
abstract class ProductDisplayingEvent {}

class InitializDisplay extends ProductDisplayingEvent {
  String id;
  InitializDisplay({required this.id});
}

class DeletingDisplay extends ProductDisplayingEvent {
  String id;
  int index;
  DeletingDisplay({required this.id, required this.index});
}
