import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vedio_call/data/model/user_model.dart';

import '../../../data/repo/auth/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.signIn(email, password);
    result.fold(
      (error) {
        emit(LoginFailure(error.toString()));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }

  Future<void> signUp(String email, String password, String name) async {
    emit(RegisterLoading());
    final result = await authRepo.signUp(email, password, name);
    result.fold(
      (error) {
        emit(RegisterFailure(error));
      },
      (success) {
        emit(RegisterSuccess());
      },
    );
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    final result = await authRepo.signOut();
    result.fold(
      (error) {
        emit(SignOutFailure(error.toString()));
      },
      (success) {
        emit(SignOutSuccess());
      },
    );
  }

  Future<void> SignInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (error) {
        emit(LoginFailure(error.toString()));
      },
      (user) {
        emit(LoginSuccess(user));
      },
    );
  }
}
