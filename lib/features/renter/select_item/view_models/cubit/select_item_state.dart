part of 'select_item_cubit.dart';

@immutable
sealed class SelectItemState {}

final class SelectItemInitial extends SelectItemState {}

final class AddRequestLoading extends SelectItemState {}

final class AddRequestSuccess extends SelectItemState {}

final class AddRequestFailed extends SelectItemState {
  final String error;

  AddRequestFailed({required this.error});
}
final class RequestAlreadyAdded extends SelectItemState {}
final class GetPlaceNameSuccess extends SelectItemState {}
