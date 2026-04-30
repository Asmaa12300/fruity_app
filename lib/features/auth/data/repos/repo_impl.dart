import 'dart:convert';
import 'dart:math' hide log;
import 'package:dartz/dartz.dart';
import 'package:fruity_app/constans.dart';
import 'package:fruity_app/core/errors/exceptions.dart';
import 'package:fruity_app/core/errors/failures.dart';
import 'package:fruity_app/core/services/database_service.dart';
import 'package:fruity_app/core/utils/backend_endpoint.dart';
import 'package:fruity_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruity_app/features/models/user_model.dart';
import '../../../../core/services/firebase_auth.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/services/shared_prefrences_singlton.dart';
import '../../domain/repos/repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FireBaseAuthService fireBaseAuthService;
  final DatabaseService databaseService;
  AuthRepositoryImpl({
    required this.databaseService,
    required this.fireBaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);

      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepositoryImpl. createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthService.deleteUser();
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await fireBaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity,);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepositoryImpl. signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await fireBaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        documentId: userEntity.uId,path:BackendEndpoint.isUserExists);
      if (isUserExists) {
        await getUserData(uid: user.uid);
      }else {
         await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepositoryImpl. signinWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await fireBaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepositoryImpl signinWithFacebook: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity (user).toMap(),
      documentId: user.uId,
    );
  }
  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getUserData(
      documentId: uid,
      path: BackendEndpoint.getUserData,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async{
    var jsonData =jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kUserData,jsonData);
  }
}