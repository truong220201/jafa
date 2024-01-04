import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../data/model/province.dart';
import '../../../data/model/tree.dart';
import 'dart:io' as io;
import 'dart:convert';
// final apiHelper = ApiHelper();

class TreeCreateApi {
  Future<Tree?> treeCreate({
    required String name,
    String? description,
    String? image,
    String? province,
    String? district,
    String? address,
    String? relationship,
  }) async {
    final bytes = io.File(image!).readAsBytesSync();

    String img64 = base64Encode(bytes);
    Map<String, dynamic> formData = {
      "name": name,
      "description": description,
      'image': img64,
      'province_id': 'province',
      'district_id': 'district',
      'address': 'address',
      'relation_name': relationship,
    };
    String documentId = '';

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      // await firestore.collection("tree_detail").add(formData);
      await FirebaseFirestore.instance
          .collection("tree_detail")
          .add(formData)
          .then((docRef) {
        // Lấy ID của tài liệu vừa thêm vào collection
        documentId = docRef.id;
        debugPrint('--------- documentId: $documentId');
      }).catchError((error) {
        debugPrint('--------- error $error');
      });
      Map<String, dynamic> userData = {
        "id_jafa": documentId,
        "user_genealogy_id": 4,
        "name": "John",
        "image":
            "https://ila.edu.vn/wp-content/uploads/2023/10/ila-tinh-tu-chi-tinh-cach-tieng-anh-1.jpeg",
        "children": [
          // {"user_genealogy_id": 5, "relation_type": "child"},
          // {"user_genealogy_id": 6, "relation_type": "child"}
        ],
        "relation_name": 'dad',
        "is_root": true,
        "self": true
      };

      String idUser = '';
      await firestore.collection("user").add(userData).then((docRef) {
        // Lấy ID của tài liệu vừa thêm vào collection
        idUser = docRef.id;
        debugPrint('--------- documentId: $documentId');
      }).catchError((error) {
        debugPrint('--------- error $error');
      });
      var snapshots = firestore.collection('user').doc(idUser).get();
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('user').doc(idUser);
      documentReference
          .update({'user_genealogy_id': idUser, "name": 'John, $idUser'});
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<Province>> getProvinces() async {
    try {
      // final response = await apiHelper.get(path: '/api/cities');

      // List<Province> data = response.data['data']
      //     .map<Province>((n) => Province.fromJson(n))
      //     .toList();
      // print(data);
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
