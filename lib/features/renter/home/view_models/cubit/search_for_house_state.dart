part of 'search_for_house_cubit.dart';

sealed class SearchForHouseState {}

final class SearchForHouseInitial extends SearchForHouseState {}

final class SearchForHouseLoading extends SearchForHouseState {}

final class SearchForHouseSuccess extends SearchForHouseState {
  final List<HouseModel> houses;
  SearchForHouseSuccess({required this.houses});
}

final class SearchForHouseFailed extends SearchForHouseState {
  final String errorMessage;
  SearchForHouseFailed({required this.errorMessage});
}
final class SearchForHouseEmpty extends SearchForHouseState {
}

final class RequestLocationPermission extends SearchForHouseState {}

final class SelectHouseType extends SearchForHouseState {
  final int houseTypeId;
  SelectHouseType({required this.houseTypeId});
}
