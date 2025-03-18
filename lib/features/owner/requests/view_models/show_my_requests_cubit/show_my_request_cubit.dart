import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
part 'show_my_request_state.dart';

class ShowMyRequestCubit extends Cubit<ShowMyRequestState> {
  ShowMyRequestCubit({required this.id}) : super(ShowMyRequestLoading()) {
    getRequests();
  }
  final String id;
  StreamSubscription? _streamSubscription;
  List<RequestModel> requests = [];
  getRequests() {
    _streamSubscription =
        streamDataWithSpecificId(tableName: "requests", id: id).listen(
      (data) {
        if (data.isNotEmpty) {
          requests =
              data.map((request) => RequestModel.fromJson(request)).toList();
          emit(ShowMyRequestSuccess());
        } else {
          emit(ShowMyRequestEmpty());
        }
      },
      onError: (error) {
        emit(ShowMyRequestFailure(error: error.toString()));
      },
    );
  }
}
