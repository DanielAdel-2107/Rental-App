import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rental_app/core/helper/location/find_nearest_place.dart';
import 'package:rental_app/core/helper/location/get_current_location.dart';
import 'package:rental_app/core/helper/location/location_permission.dart';
import 'package:rental_app/core/network/supabase/database/get_stream_data.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
part 'search_for_house_state.dart';

class SearchForHouseCubit extends Cubit<SearchForHouseState> {
  SearchForHouseCubit() : super(SearchForHouseLoading()) {
    checkLocationPermmision();
  }
  StreamSubscription<List<Map<String, dynamic>>>? _streamSubscription;
  List<HouseModel> allPlaces = [];
  late bool hasPermission;
  late Position position;
  SearchForHouseSuccess? previousState;
  List<HouseModel>? nearbyCurrentLocation;

  checkLocationPermmision() async {
    hasPermission = await requestLocationPermission();
    if (hasPermission == true) {
      emit(SearchForHouseLoading());
      position = await getCurrentLocation();
      getMyHouses();
    } else {
      emit(RequestLocationPermission());
    }
  }

  void getMyHouses() {
    _streamSubscription = streamData(tableName: "houses").listen(
      (data) async {
        if (data.isNotEmpty) {
          allPlaces = data.map((house) => HouseModel.fromJson(house)).toList();
          await getNearFromYoy();
        } else {
          emit(SearchForHouseEmpty());
        }
      },
      onError: (error) {
        emit(SearchForHouseFailed(errorMessage: error.toString()));
      },
    );
  }

  getNearFromYoy() async {
    try {
      nearbyCurrentLocation = await findNearbyPlaces(
          allPlaces: allPlaces, currentLocation: position);
      filterList = nearbyCurrentLocation!;
      emit(SearchForHouseSuccess(
        houses: nearbyCurrentLocation ?? [],
      ));
    } on Exception catch (e) {
      emit(SearchForHouseFailed(errorMessage: e.toString()));
    }
    if (state is SearchForHouseSuccess) {
      previousState = state as SearchForHouseSuccess;
    }
  }

  /////////////
  List<String> houseType = [
    "House",
    "Apartment",
    "Hotel",
    "Villa",
    "Townhouse",
  ];
  void selectType({required int houseTypeId}) {
    filterByCategory(category: houseType[houseTypeId]);
    emit(SelectHouseType(houseTypeId: houseTypeId));
  }

  List<HouseModel> filterList = [];
  void filterByCategory({required String category}) {
    filterList = nearbyCurrentLocation!
        .where((house) => house.category == category)
        .toList();
    emit(SearchForHouseSuccess(houses: filterList));
    if (state is SearchForHouseSuccess) {
      previousState = state as SearchForHouseSuccess;
    }
  }

  List<HouseModel> searchList = [];
  searchForHouse({required String query}) {
    searchList = filterList
        .where((house) => house.ownerName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchForHouseSuccess(houses: searchList));
    if (state is SearchForHouseSuccess) {
      previousState = state as SearchForHouseSuccess;
    }
  }
}
