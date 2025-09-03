import 'package:dartz/dartz.dart';

import 'package:vedio_call/core/errors/failures.dart';
import 'package:vedio_call/data/model/user_model.dart';
import 'package:vedio_call/data/services/auth/auth_services.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices authServices;

  AuthRepoImpl(this.authServices);
  @override
  Future<Either<Failure, UserModel>> signIn(String email, String password) async {
    try {
     UserModel user= await authServices.signIn(email, password);
      return right(user);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
     final user= await authServices.signInWithGoogle();
      return right(user);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authServices.signOut();
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      await authServices.signUp(email, password, name);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
