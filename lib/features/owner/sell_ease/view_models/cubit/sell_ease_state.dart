part of 'sell_ease_cubit.dart';

@immutable
sealed class SellEaseState {}

final class SellEaseInitial extends SellEaseState {}
final class UpdateAreaProperties extends SellEaseState {}
final class SelectImageLoading extends SellEaseState {}
final class SelectImageSuccess extends SellEaseState {}
final class SelectImageFailure extends SellEaseState {
  final String errorMessage;

 SelectImageFailure({required this.errorMessage });
}
final class UploadDataLoading extends SellEaseState {}
final class UploadDataSuccess extends SellEaseState {}
final class UploadDataFailure extends SellEaseState {
  final String errorMessage;

 UploadDataFailure({required this.errorMessage });
}
final class SelectLocationLoading extends SellEaseState {}
final class SelectLocationSuccess extends SellEaseState {}
final class SelectLocationFailure extends SellEaseState {
  final String errorMessage;

 SelectLocationFailure({required this.errorMessage });
}
