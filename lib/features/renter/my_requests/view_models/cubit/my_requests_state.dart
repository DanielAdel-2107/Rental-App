part of 'my_requests_cubit.dart';

@immutable
sealed class MyRequestsState {}

final class MyRequestsInitial extends MyRequestsState {}

final class GetMyRequestsSuccess extends MyRequestsState {}

final class GetMyRequestsLoading extends MyRequestsState {}

final class GetMyRequestsFailed extends MyRequestsState {
  final String errorMessage;

  GetMyRequestsFailed({required this.errorMessage});
}

final class GetMyRequestsEmpty extends MyRequestsState {}
final class DeleteRequestLoading extends MyRequestsState {}
final class DeleteRequestSuccess extends MyRequestsState {}
final class DeleteRequestFailure extends MyRequestsState {
  final String errorMessage;
  DeleteRequestFailure({required this.errorMessage});
}
