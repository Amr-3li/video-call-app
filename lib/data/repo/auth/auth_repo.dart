import 'package:dartz/dartz.dart';
import 'package:vedio_call/data/model/user_model.dart';

import '../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signInWithGoogle();
 Future<Either<Failure, UserModel>> signIn(String email, String password);
 Future<Either<Failure, void>> signUp(String email, String password, String name  );
 Future<Either<Failure, void>> signOut();

}
