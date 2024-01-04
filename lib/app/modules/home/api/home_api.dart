import 'package:flutter/material.dart';

import '../../../data/model/jafa_model.dart';
// import '../../../core/base/base_remote_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<JafaModel>> getHomeDetail() async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('tree_detail');
      QuerySnapshot querySnapshot = await collectionRef.get();

      List<JafaModel> javaModels =
          querySnapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        // dynamic a = data['image'];
        Map<String, dynamic> dataa = {
          "image": data['image'],
          "total_user": data['total_user'],
          "province": data['province'],
          "role_id": data['role_id'],
          "level": data['level'],
          "district": data['district'],
          "name": data['name'],
          "description": data['description'],
          "total_member": data['total_member'],
          "id": document.id,
          "relation_name": data['relation_name'],
        };
        return JafaModel.fromMap(dataa);
      }).toList();

      return javaModels;
    } catch (e) {
      debugPrint('Lỗi: $e');
      return [];
    }
    // .withConverter<JafaModel>(
    //   fromFirestore: (snapshots, _) => JafaModel.fromJson(snapshots.data()!),
    //   toFirestore: (movie, _) => movie.toJson(),
    // );
    // _onPressed();
    // final List<JafaModel> list = moviesRef.
    // try {
    //   return [
    //     // const JafaModel(
    //     //     id: 2, name: 'Nha hang b', relationName: 'a', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 1, name: 'aaa', roleId: 1, relationName: 'ss', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 1, name: 'aaa', roleId: 1, relationName: 'ss', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 3, name: 'bx', roleId: 2, relationName: 'asa', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 23, name: 'asg', relationName: 'csoo', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 4645, name: 'asdfqw', relationName: 'alod', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 2, name: 'Nha hang b', relationName: 'a', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 1, name: 'aaa', roleId: 1, relationName: 'ss', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 1, name: 'aaa', roleId: 1, relationName: 'ss', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 3, name: 'bx', roleId: 2, relationName: 'asa', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 23, name: 'asg', relationName: 'csoo', imageJafa: ''),
    //     // const JafaModel(
    //     //     id: 4645, name: 'asdfqw', relationName: 'alod', imageJafa: ''),
    //   ];
    // } catch (e) {
    //   rethrow;
    // }
  }

  // Future<List<EmailNotification>> getEmailNotifications() async {
  //   final data = await apiHelper.get(path: '/account/email-notification');
  //   return (data as List).map((e) => EmailNotification.fromJson(e)).toList();
  // }

  // Future<List<Conservation>> searchConservations({
  //   required ConservationFilter? filter,
  //   required String query,
  // }) async {
  //
  //   final Map<String, String> params = {};
  //   if (query.trim().isNotEmpty) {
  //     params['search'] = query.trim();
  //   }
  //   if (filter != null) {
  //     if (filter.companyLocation != null) {
  //       params['location1'] = filter.companyLocation!.id.id.toString();
  //     }
  //     if (filter.location1 != null) {
  //       params['location2'] = filter.location1!.id.id.toString();
  //     }
  //     if (filter.location2 != null) {
  //       params['location3'] = filter.location2!.id.id.toString();
  //     }
  //     if (filter.conservationKind != null) {
  //       params['conservation_kind_id'] =
  //           filter.conservationKind!.id.id.toString();
  //     }
  //     if (filter.responPerson != null) {
  //       params['created_id'] = filter.responPerson!.id.id.toString();
  //     }
  //   }
  //   final data =
  //       await apiHelper.get(path: '/conservation-rule', parameters: params);
  //   return (data as List).map((e) => Conservation.fromJson(e)).toList();
  // }

  // Future<void> registerFCM() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? firstLogin = prefs.getString('firstLoginToken');
  //   final String? token = await FirebaseMessaging.instance.getToken();
  //   await apiHelper.post(
  //     path: '/auth/register-fcm-token',
  //     data: {
  //       'first_login_token': firstLogin,
  //       'fcm_token': token,
  //     },
  //   );
  // }
}
