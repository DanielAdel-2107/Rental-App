import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/network/supabase/database/add_data.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'select_item_state.dart';

class SelectItemCubit extends Cubit<SelectItemState> {
  SelectItemCubit() : super(SelectItemInitial());

  final PageController controller = PageController();
  final TextEditingController reportController = TextEditingController();
  bool requestAdded = false;
  Future<void> addRequest({required HouseModel house}) async {
    final supabase = getIt<SupabaseClient>();
    final userId = supabase.auth.currentUser!.id;
    requestAdded = await _isRequestAlreadyAdded(house.id, userId);
    if (requestAdded) {
      emit(RequestAlreadyAdded());
      return;
    }
    try {
      emit(AddRequestLoading());
      final String userName = await _getUserName(userId);
      await _updateHouseRequestCount(house);
      await _addRequestToDatabase(house, userId, userName);
      emit(AddRequestSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddRequestFailed(error: e.toString()));
    }
  }

  Future<bool> _isRequestAlreadyAdded(String houseId, String userId) async {
    final supabase = getIt<SupabaseClient>();
    final List data = await supabase
        .from("requests")
        .select()
        .eq("id", houseId)
        .eq("renter_id", userId);
    return data.isNotEmpty;
  }

  Future<String> _getUserName(String renterId) async {
    final supabase = getIt<SupabaseClient>();
    final user = await supabase
        .from("users")
        .select("user_name")
        .eq("id", renterId)
        .single();
    return user["user_name"] ?? "Unknown";
  }

  Future<void> _updateHouseRequestCount(HouseModel house) async {
    final supabase = getIt<SupabaseClient>();
    await supabase
        .from("houses")
        .update({"request": house.request + 1})
        .eq("id", house.id)
        .eq("user_id", house.userId);
  }

  Future<void> _addRequestToDatabase(
      HouseModel house, String renterId, String userName) async {
    await addData(
      tableName: "requests",
      data: {
        "owner_id": house.userId,
        "renter_id": renterId,
        "images": {"urls": house.image},
        "title": house.title,
        "description": house.description,
        "price": house.price,
        "id": house.id,
        "user_name": userName,
        "report":
            reportController.text.isEmpty ? "No Report" : reportController.text,
      },
    );
  }

  String locationName = 'loading...';
  Future<void> getPlaceName(
      {required String longitude, required String latitude}) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(latitude),
        double.parse(longitude),
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationName = "${place.street}, ${place.locality}, ${place.country}";
      }
      emit(GetPlaceNameSuccess());
    } catch (e) {
      locationName = "Location not found";
    }
  }
}
