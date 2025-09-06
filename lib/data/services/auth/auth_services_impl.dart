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

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: EndPoints.googleServerId,
    scopes: ['email', 'profile'],
  );

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      final cradintial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (cradintial.user == null) {
        throw ('User not found');
      }
      final snapshot = await firestore
          .collection('users')
          .doc(cradintial.user!.uid)
          .get();
      final userData = UserModel.fromJson(snapshot.data() ?? {});

      await SharedPreferenceSingelton.setString("userId", cradintial.user!.uid);
      await SharedPreferenceSingelton.setString("userName", userData.name);
      return userData;
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      throw Exception('Failed to sign in');
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw ('User cancelled the sign-in process');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw ('Firebase authentication failed');
      }
      final UserModel user = UserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email!,
        name:
            firebaseUser.displayName ??
            googleUser.displayName ??
            'Unknown User',
      );
      await _saveUserToFirestore(user);
      await _saveUserToPreferences(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      throw ('Failed to sign in with Google');
    }
  }

  Future<void> _saveUserToFirestore(UserModel user) async {
    try {
      await firestore
          .collection('users')
          .doc(user.id)
          .set(user.toJson(), SetOptions(merge: true));
    } catch (e) {
      throw ('Failed to save user to database');
    }
  }

  Future<void> _saveUserToPreferences(UserModel user) async {
    try {
      await Future.wait([
        SharedPreferenceSingelton.setString("userId", user.id),
        SharedPreferenceSingelton.setString("userEmail", user.email),
        SharedPreferenceSingelton.setString("userName", user.name),
      ]);
    } catch (e) {
      ('Failed to save user preferences');
    }
  }

  @override
  Future<void> signUp(String email, String password, String name) async {
    try {
    final cradintial =  await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (cradintial.user == null)  return ;
      final user = UserModel(
        id: cradintial.user!.uid,
        name: name,
        email: email,
        imageUrl: '',
      );
      await firestore.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      throw 'Failed to sign up';
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
