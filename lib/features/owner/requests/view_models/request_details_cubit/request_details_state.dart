part of 'request_details_cubit.dart';

sealed class RequestDetailsState {}

final class RequestDetailsInitial extends RequestDetailsState {}

final class UpdateRequestStateLoading extends RequestDetailsState {}

final class UpdateRequestStateSuccess extends RequestDetailsState {}

final class UpdateRequestStateAcceptedSuccess extends RequestDetailsState {}

final class UpdateRequestStateFailed extends RequestDetailsState {
  final String error;
  UpdateRequestStateFailed({required this.error});
}

final class RequestStateEmpty extends RequestDetailsState {}
