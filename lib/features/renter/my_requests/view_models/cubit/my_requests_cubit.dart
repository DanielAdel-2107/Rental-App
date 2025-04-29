import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'my_requests_state.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  MyRequestsCubit() : super(GetMyRequestsLoading()) {
    getMyRequests();
  }
  StreamSubscription? _streamSubscription;
  List<RequestModel> requests = [];
  final pageController = PageController();
  getMyRequests() {
    _streamSubscription = streamDataWithSpecificId(
            tableName: "requests",
            primaryKey: 'renter_id',
            id: getIt<SupabaseClient>().auth.currentUser!.id)
        .listen(
      (data) {
        if (data.isNotEmpty) {
          requests =
              data.map((request) => RequestModel.fromJson(request)).toList();
          emit(GetMyRequestsSuccess());
        } else {
          emit(GetMyRequestsEmpty());
        }
      },
      onError: (error) {
        emit(GetMyRequestsFailed(errorMessage: error.toString()));
      },
    );
  }

  deleteRequest({required String id}) async {
    try {
      emit(DeleteRequestLoading());
      await getIt<SupabaseClient>()
          .from('requests')
          .delete()
          .eq('request_id', id);
      emit(DeleteRequestLoading());
    } on Exception catch (e) {
      emit(
        DeleteRequestFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
