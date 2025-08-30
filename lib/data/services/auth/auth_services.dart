abstract class AuthServices {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> signUp(String email, String password, String name);
  Future<void> signInWithGoogle();
}
