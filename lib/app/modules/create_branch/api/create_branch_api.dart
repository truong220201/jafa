import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';

class CreateBranchApi {
  Future<String?> createBranch({
    required String createType,
    required String userGenealogyId,
    required String genealogyId,
  }) async {
    Map<String, dynamic> formData = {
      "relation_name": createType,
      "user_genealogy_id": '',
      "id_jafa": genealogyId,
      "name": 'anonymous',
      'image':
          'https://ila.edu.vn/wp-content/uploads/2023/10/ila-tinh-tu-chi-tinh-cach-tieng-anh-1.jpeg',
      'children': [
        {"user_genealogy_id": userGenealogyId, "relation_type": createType}
      ],
      // 'is_root':true
      //truong hop tao bo
      'is_root': createType == 'dad' ? true : false,
      'self': true
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // await firestore.collection("user").add(formData);
      String idUser = '';
      await firestore.collection("user").add(formData).then((docRef) {
        // Lấy ID của tài liệu vừa thêm vào collection
        idUser = docRef.id;
        // debugPrint('--------- documentId: $documentId');
      }).catchError((error) {
        debugPrint('--------- error $error');
      });
      //update id tk vua tao
      String type = '';

      if (createType == 'dad') {
        type = 'child';
        DocumentReference documentReference =
            FirebaseFirestore.instance.collection('user').doc(idUser);
        documentReference.update({
          // 'is_root': false,
          'user_genealogy_id': idUser,
          "name": 'anonymous $idUser',
        });
        //thay doi con
        TreeViewModel checkParrent = await toModel(idUser);
        String idChild = '';
        for (Parrent e in checkParrent.childrenParrent) {
          if (e.relationType == 'dad') {
            idChild = e.id ?? '';
          }
        }
        DocumentReference documentReferenceP =
            FirebaseFirestore.instance.collection('user').doc(idChild);

        List<Parrent> listAdd = [];
        List<Parrent> listAddTemp = [];
        TreeViewModel req = await toModel(idChild);
        try {
          if (req.childrenParrent.isNotEmpty) {
            listAdd = req.childrenParrent;
            listAddTemp = [
              ...req.childrenParrent,
              ...[Parrent(id: idUser, relationType: type)]
            ];
            listAdd = listAddTemp;
          }
        } catch (e) {
          debugPrint('bug$e');
          rethrow;
        }
        List<Map<String, dynamic>> addToJson =
            listAdd.map((e) => e.toJson()).toList();
        documentReferenceP.update({'is_root': false, 'children': addToJson});
        debugPrint('---------here');
        //thay doi bo
      } else if (createType == 'child') {
        type = 'dad';
        DocumentReference documentReference =
            FirebaseFirestore.instance.collection('user').doc(idUser);
        documentReference.update({
          // 'is_root': false,
          'user_genealogy_id': idUser,
          "name": 'anonymous $idUser',
        });
        //thay doi con
        TreeViewModel checkParrent = await toModel(idUser);
        String idChild = '';
        for (Parrent e in checkParrent.childrenParrent) {
          if (e.relationType == 'child') {
            idChild = e.id ?? '';
          }
        }
        DocumentReference documentReferenceP =
            FirebaseFirestore.instance.collection('user').doc(idChild);

        List<Parrent> listAdd = [];
        List<Parrent> listAddTemp = [];
        TreeViewModel req = await toModel(idChild);
        try {
          if (req.childrenParrent.isNotEmpty) {
            listAdd = req.childrenParrent;
            listAddTemp = [
              ...req.childrenParrent,
              ...[Parrent(id: idUser, relationType: type)]
            ];
            listAdd = listAddTemp;
          } else {
            List<Parrent> listTemp = [Parrent(id: idUser, relationType: type)];
            listAdd = listTemp;
          }
        } catch (e) {
          debugPrint('bug$e');
          rethrow;
        }
        List<Map<String, dynamic>> addToJson =
            listAdd.map((e) => e.toJson()).toList();
        documentReferenceP.update({'children': addToJson});
        debugPrint('---------here');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TreeViewModel> toModel(String userGenealogyId) async {
    TreeViewModel request = const TreeViewModel();
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(userGenealogyId)
        .get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    request = TreeViewModel.fromJson(data);
    return request;
  }
}
