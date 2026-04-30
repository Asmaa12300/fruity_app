import 'package:fruity_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruity_app/features/models/user_model.dart';
import 'database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
    await firestore.collection(path).add(data);
  }

  Future<dynamic> getUserData({
     String? documentId,
    required String path,
    Map<String, dynamic>? query,
  }) async {
    if (documentId!= null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return (data.data() as Map<String, dynamic>);
    }else {
      Query<Map<String, dynamic>> data =  firestore.collection(path);
      if(query!=null){
        if (query ['orderBy'] != null) {
          var orderByField = query ['orderBy'] ;
          var descending = query ['descending'];
          data=data.orderBy(orderByField, descending: descending );
        }
        if (query ['limit'] != null) {
          var limit = query ['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()as Map<String,dynamic>).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String documentId,
    required String path,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
