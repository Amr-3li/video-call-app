part of 'get_user_cubit.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUserLoading extends GetUserState {}

final class GetUserSuccess extends GetUserState {
  final UserModel user;
  GetUserSuccess( this.user);
}

final class GetUserError extends GetUserState {
  String error;
  GetUserError(this.error);
}
