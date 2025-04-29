abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {}
class SignUpFailed extends SignUpState {
  final String errorMessage;
  SignUpFailed({required this.errorMessage});
}
class FieldRequired extends SignUpState {}
