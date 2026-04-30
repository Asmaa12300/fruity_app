import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthService {
  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService. deleteUser: ${e.toString()} and code is ${e.code}',);
      if (e.code == 'requires-recent-login') {
        throw CustomException(message: 'الرجاء تسجيل الدخول مرة اخرى قبل حذف الحساب.',);
      } else {
        throw CustomException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',);
      }
    } catch (e) {
      log('Exception in FireBaseAuthService. deleteUser: ${e.toString()}',);
      throw CustomException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService. createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}',);
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول',);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت. الرجاء المحاولة مرة اخرى.',);
      } else {
        throw CustomException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',);
      }
    } catch (e) {
      log('Exception in FireBaseAuthService. createUserWithEmailAndPassword: ${e.toString()}',);
      throw CustomException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService. signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}',);
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'المستخدم غير موجود. الرجاء التحقق من البريد الالكتروني.',);
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة. الرجاء المحاولة مرة اخرى.',);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت. الرجاء المحاولة مرة اخرى.',);
      } else {
        throw CustomException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',);
      }
    } catch (e) {
      log('Exception in FireBaseAuthService. signInWithEmailAndPassword: ${e.toString()}',);
      throw CustomException(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser!= null;
  }
}
