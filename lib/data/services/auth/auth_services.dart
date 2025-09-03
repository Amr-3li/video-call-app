import '../../model/user_model.dart';

abstract class AuthServices {
  Future<UserModel > signIn(String email, String password);
  Future<void> signOut();
  Future<void> signUp(String email, String password, String name);
  Future<UserModel> signInWithGoogle();
}
