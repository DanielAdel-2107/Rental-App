abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInLoading extends SignInState {}
class SignInSuccess extends SignInState {
  final String route;
  SignInSuccess({required this.route});
}
class SignInFailed extends SignInState {
  final String errorMessage;
  SignInFailed({required this.errorMessage});
}
