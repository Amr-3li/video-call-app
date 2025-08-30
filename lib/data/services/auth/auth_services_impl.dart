import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vedio_call/core/constants/end_points.dart';
import 'package:vedio_call/core/errors/firebase_exeption_handler.dart';
import 'package:vedio_call/core/services/sharedpreference_singelton.dart';
import 'package:vedio_call/data/model/user_model.dart';
import 'package:vedio_call/data/services/auth/auth_services.dart';

class AuthServicesImpl implements AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> signIn(String email, String password) async {
    try {
      final cradintial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final snapshot = await firestore
          .collection('users')
          .doc(cradintial.user!.uid)
          .get();
      final userData = UserModel.fromJson(snapshot.data()!);

      await SharedPreferenceSingelton.setString("userId", cradintial.user!.uid);
      await SharedPreferenceSingelton.setString("userName", userData.name);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: EndPoints.googleClientId, // For web apps
        serverClientId: EndPoints.googleServerId, // For Android/iOS
      );

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      firestore.collection('users').doc(googleUser.id).set({
        'id': googleUser.id,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'imageUrl': googleUser.photoUrl,
      });
    } catch (e) {
      print('Google sign-in error: $e');
      return null;
    }
  }

  @override
  Future<void> signUp(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = _auth.currentUser;
      final newUser = UserModel(
        id: user!.uid,
        name: name,
        email: email,
        imageUrl: '',
      );
      await firestore.collection('users').doc(user.uid).set(newUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await SharedPreferenceSingelton.remove("userId");
      await SharedPreferenceSingelton.remove("userName");
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }
}
