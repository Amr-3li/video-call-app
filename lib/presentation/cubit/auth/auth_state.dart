part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
 final class RegisterLoading extends AuthState {}
 final class RegisterSuccess extends AuthState {}
  final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
  }
  //================== Login ==============
 final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final UserModel user;
  LoginSuccess(this.user);
}
final class LoginFailure extends AuthState {
 final String errorMessage;
 LoginFailure(this.errorMessage);

}
//================== SignOut ==============
 final class SignOutLoading extends AuthState {}
final class SignOutSuccess extends AuthState {}
final class SignOutFailure extends AuthState {
 final String errorMessage;
 SignOutFailure(this.errorMessage);
}