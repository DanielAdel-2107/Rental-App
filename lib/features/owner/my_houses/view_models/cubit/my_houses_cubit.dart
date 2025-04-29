import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'my_houses_state.dart';

class MyHousesCubit extends Cubit<MyHousesState> {
  MyHousesCubit() : super(GetMyHouseLoading()) {
    getMyHouses();
  }

  final pageController = PageController(viewportFraction: 0.8);
  StreamSubscription<List<Map<String, dynamic>>>? _streamSubscription;
  List<HouseModel> myHouses = [];
  void getMyHouses() {
    _streamSubscription = streamDataWithSpecificId(
            tableName: "houses",
            id: getIt<SupabaseClient>().auth.currentUser!.id,
            primaryKey: 'user_id')
        .listen(
      (data) {
        if (data.isNotEmpty) {
          myHouses = data.map((house) => HouseModel.fromJson(house)).toList();
          emit(GetMyHouseSuccess());
        } else {
          emit(GetMyHouseEmpty());
        }
      },
      onError: (error) {
        emit(GetMyHouseFailure(errorMessage: error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
