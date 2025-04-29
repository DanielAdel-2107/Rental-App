import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'request_details_state.dart';

class RequestDetailsCubit extends Cubit<RequestDetailsState> {
  RequestDetailsCubit() : super(RequestDetailsInitial());
  final pageController = PageController(viewportFraction: 0.8);
  final stateController = TextEditingController();
  updateRequestState({required String id, required String userId}) async {
    if (stateController.text.isNotEmpty) {
      try {
        emit(UpdateRequestStateLoading());
        await getIt<SupabaseClient>()
            .from('requests')
            .update({"status": stateController.text})
            .eq("request_id", id)
            .eq("renter_id", userId);
        if (stateController.text == "Accepted") {
          await getIt<SupabaseClient>().from('chats').upsert({
            "id": id,
            "messages": {"messages": []},
          });
          emit(UpdateRequestStateAcceptedSuccess());
        } else {
          await getIt<SupabaseClient>().from('chats').delete().eq("id", id);
          emit(UpdateRequestStateSuccess());
        }
      } on Exception catch (e) {
        emit(UpdateRequestStateFailed(error: e.toString()));
      }
    } else {
      emit(RequestStateEmpty());
    }
  }
}
