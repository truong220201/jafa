import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';

class TreeViewApi {
  Future<List<TreeViewModel>> getTreeViewDetail(String id) async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('user');
      QuerySnapshot querySnapshot = await collectionRef.get();
      List<Map<String, dynamic>> dataList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      List<TreeViewModel> jafaModels = [];

      List<TreeViewModel> treeViewModelList =
          dataList.map((jsonData) => TreeViewModel.fromJson(jsonData)).toList();
      for (TreeViewModel o in treeViewModelList) {
        if (o.idJafa == id) {
          jafaModels.add(o);
        }
      }

      return jafaModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> treeRequest({
    required String userGenealogyId,
    required String genealogyId,
  }) async {
    // final request = dioClient.post(ApiUrlConstants.treeRequest, data: data);
    try {
      // return callApiWithErrorParser(request)
      //     .then((value) => value.data["message"]);
      return '';
    } catch (e) {
      rethrow;
    }
  }
}
