import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/helper/location/get_current_location.dart';
import 'package:rental_app/core/helper/location/location_permission.dart';
import 'package:rental_app/core/helper/pick_image.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/network/supabase/database/add_data.dart';
import 'package:rental_app/core/network/supabase/storage/upload_file.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sell_ease_state.dart';

class SellEaseCubit extends Cubit<SellEaseState> {
  SellEaseCubit() : super(SellEaseInitial());
  final houseNameController = TextEditingController();
  final houseDescriptionController = TextEditingController();
  final userNameController = TextEditingController();
  final priceController = TextEditingController();
  final typeController = TextEditingController();
  final moreDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final pageController = PageController(viewportFraction: 0.8);
  List<File>? files;
  Map<String, dynamic> data = {'urls': []};
  uploadHouse() async {
    if (formKey.currentState!.validate() &&
        files != null &&
        position != null &&
        numOfBathRoom != null &&
        numOfbedRoom != null &&
        typeController.text.isNotEmpty &&
        totalArea != null) {
      try {
        emit(UploadDataLoading());
        for (File file in files!) {
          (data['urls'] as List)
              .add(await uploadFileToSupabaseStorage(file: file));
        }
        await addData(
          tableName: "houses",
          data: {
            'user_id': getIt<SupabaseClient>().auth.currentUser!.id,
            'user_name': userNameController.text,
            'price': priceController.text,
            'house_name': houseNameController.text,
            'house_description': houseDescriptionController.text,
            'more_data': moreDateController.text,
            'area': totalArea,
            'number_of_bathroom': numOfBathRoom,
            'number_of_bedroom': numOfbedRoom,
            'latitude': position!.latitude,
            'longtude': position!.longitude,
            'images': data,
            "category":typeController.text
          },
        );
        emit(UploadDataSuccess());
      } on Exception catch (e) {
        emit(UploadDataFailure(errorMessage: e.toString()));
      }
    } else {
      showCustomClipperDialog(
          title: "Hint", message: "Please, Fill all of the fields");
    }
  }

  // pick images
  void pickImage() async {
    emit(SelectImageLoading());
    await pickAndUploadImages().then(
      (value) {
        if (value != null) {
          files?.clear();
          files = value;
          emit(SelectImageSuccess());
        } else {
          emit(SelectImageFailure(errorMessage: "No images were selected"));
        }
      },
    );
  }

  // get current location
  bool hasPermission = false;
  Position? position;
  getLocation() async {
    hasPermission = await requestLocationPermission();
    if (hasPermission) {
      try {
        emit(SelectLocationLoading());
        position = await getCurrentLocation();
        emit(SelectLocationSuccess());
      } on Exception catch (e) {
        emit(SelectLocationFailure(errorMessage: e.toString()));
      }
    }
  }

  // select house properties
  int? numOfBathRoom;
  int? numOfbedRoom;
  int? totalArea;

  void changeNumberOfBathRoom(int value) {
    numOfBathRoom = value;
    emit(UpdateAreaProperties());
  }

  void changeNumberOfBedRoom(int value) {
    numOfbedRoom = value;
    emit(UpdateAreaProperties());
  }

  void changeTotalArea(int value) {
    totalArea = value;
    emit(UpdateAreaProperties());
  }
}
