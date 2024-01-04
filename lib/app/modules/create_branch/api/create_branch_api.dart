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
    //tao me
    // if (createType == 'mom') {
    //   TreeViewModel request = TreeViewModel();
    //   request = await toModel(userGenealogyId);
    //   // QuerySnapshot querySnapshot = await collectionRef.get();

    //   // querySnapshot.docs.map((DocumentSnapshot document) {
    //   //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //   //   if (userGenealogyId == document.id) {
    //   //     request = TreeViewModel.fromJson(data);
    //   //   }
    //   // }).toList();
    //   debugPrint('-------------------' + request.childrenParrent.toString());
    //   String idDad = '';
    //   for (Parrent e in request.childrenParrent) {
    //     if (e.relationType == 'couple') {
    //       idDad = e.id ?? '';
    //     }
    //   }
    //   formData = {
    //     "relation_name": createType,
    //     "user_genealogy_id": '',
    //     "id_jafa": genealogyId,
    //     "name": 'anonymous',
    //     'image':
    //         'https://ila.edu.vn/wp-content/uploads/2023/10/ila-tinh-tu-chi-tinh-cach-tieng-anh-1.jpeg',
    //     'children': [
    //       {"user_genealogy_id": userGenealogyId, "relation_type": createType},
    //       {"user_genealogy_id": idDad, "relation_type": 'couple'}
    //     ],
    //     // 'is_root':true
    //     //truong hop tao bo
    //     'is_root': false,
    //     'self': false
    //   };
    // }
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
          debugPrint('bug' + e.toString());
          rethrow;
        }
        List<Map<String, dynamic>> addToJson =
            listAdd.map((e) => e.toJson()).toList();
        documentReferenceP.update({'is_root': false, 'children': addToJson});
        debugPrint('---------here');
        //thay doi bo
      }
      // else if (createType == 'mom') {
      //   type = 'child';
      //   DocumentReference documentReference =
      //       FirebaseFirestore.instance.collection('user').doc(idUser);
      //   documentReference.update({
      //     'user_genealogy_id': idUser,
      //     "name": 'anonymous $idUser',
      //   });
      //   //is_root = false tk duoc tao
      //   DocumentReference documentReferenceP =
      //       FirebaseFirestore.instance.collection('user').doc(userGenealogyId);

      //   List<Parrent> listAdd = [];
      //   List<Parrent> listAddTemp = [];
      //   TreeViewModel req = await toModel(userGenealogyId);
      //   if (req.childrenParrent.isNotEmpty) {
      //     listAdd = req.childrenParrent;
      //     listAddTemp = [
      //       ...req.childrenParrent,
      //       ...[Parrent(id: idUser, relationType: 'couple')]
      //     ];
      //     listAdd = listAddTemp;
      //   } else {
      //     try {
      //       listAddTemp = [Parrent(id: idUser, relationType: 'couple')];
      //       listAdd = listAddTemp;
      //     } catch (e) {
      //       debugPrint('bug couple' + e.toString());
      //     }
      //   }
      //   List<Map<String, dynamic>> addToJson =
      //       listAdd.map((e) => e.toJson()).toList();
      //   documentReferenceP.update({'children': addToJson});
      // }
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
