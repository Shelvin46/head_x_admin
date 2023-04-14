part of 'description_detail_bloc.dart';

@immutable
abstract class DescriptionDetailEvent {}

class DescriptionDetail extends DescriptionDetailEvent {
  String id;
  int index;
  DescriptionDetail({required this.id, required this.index});
}
