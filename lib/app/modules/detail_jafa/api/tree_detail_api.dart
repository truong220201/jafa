import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/data/model/tree_detail_model.dart';

class TreeDetailApi {
  Future<TreeDetailModel> getTreeDetail(String idJafa) async {
    try {
      TreeDetailModel request = TreeDetailModel();
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('tree_detail');
      QuerySnapshot querySnapshot = await collectionRef.get();

      querySnapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        if (idJafa == document.id) {
          request = TreeDetailModel.fromMap(data);
        }
      }).toList();

      return request;
    } catch (e) {
      debugPrint('Lỗi: $e');
      return TreeDetailModel();
    }
  }

  Future<String> deleteJafa(String idJafa, bool isDestroy) async {
    // final baseUrl = BuildConfig.instance.config.apiBaseUrl;

    // final request = dioClient.delete(
    //   isDestroy
    //       ? '$baseUrl/api/genealogy/$idJafa?destroy=true'
    //       : '$baseUrl/api/genealogy/$idJafa',
    // );
    // return await callApiWithErrorParser(request).then(
    //     (response) => BaseResponse.fromJson(json: response.data).message ?? '');
    return '';
  }

  Future<String> leavingJafa(String idJafa) async {
    // final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    // final request = dioClient.delete(
    //   '$baseUrl/api/genealogy/${idJafa.toString()}/leave',
    // );
    // final responseData = await callApiWithErrorParser(request)
    //     .then((response) => BaseResponse.fromJson(json: response.data));
    // return responseData;
    return '';
  }
}
