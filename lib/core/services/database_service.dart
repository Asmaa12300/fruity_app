import 'package:flutter/material.dart';
import 'package:fruity_app/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,String ? documentId,
  });

  Future<dynamic> getUserData({
     String? documentId,
    required String path,
    Map<String, dynamic>? query,
  });


  Future<bool> checkIfDataExists({
    required String documentId,
    required String path,
  });
}
