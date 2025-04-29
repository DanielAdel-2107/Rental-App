part of 'my_houses_cubit.dart';

sealed class MyHousesState {}

final class MyHousesInitial extends MyHousesState {}
final class GetMyHouseLoading extends MyHousesState {}
final class GetMyHouseSuccess extends MyHousesState {}
final class GetMyHouseEmpty extends MyHousesState {}

final class GetMyHouseFailure extends MyHousesState {
  final String errorMessage;

   GetMyHouseFailure({required this.errorMessage });
}
