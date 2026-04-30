import 'package:fruity_app/core/errors/failures.dart';
import 'package:fruity_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
    String email, String password,String name);

  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword(
    String email, String password);

  Future<Either<Failure,UserEntity>> signInWithGoogle();
  Future<Either<Failure,UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
  Future <UserEntity>getUserData({required String uid});

}
