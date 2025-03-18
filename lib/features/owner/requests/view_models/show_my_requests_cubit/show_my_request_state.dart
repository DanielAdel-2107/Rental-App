part of 'show_my_request_cubit.dart';

sealed class ShowMyRequestState {}

final class ShowMyRequestInitial extends ShowMyRequestState {}

final class ShowMyRequestLoading extends ShowMyRequestState {}

final class ShowMyRequestSuccess extends ShowMyRequestState {}

final class ShowMyRequestFailure extends ShowMyRequestState {
  final String error;
  ShowMyRequestFailure({required this.error});
}

final class ShowMyRequestEmpty extends ShowMyRequestState {}
