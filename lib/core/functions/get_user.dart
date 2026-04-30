
import 'dart:convert';

import 'package:fruity_app/constans.dart';
import 'package:fruity_app/core/services/shared_prefrences_singlton.dart';
import 'package:fruity_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruity_app/features/models/user_model.dart';

UserEntity getUser(){
 var joString = SharedPreferencesSingleton.getString(kUserData);
 var userEntity =UserModel.fromJson(jsonDecode(joString));
  return userEntity;
}