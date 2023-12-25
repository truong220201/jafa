import 'dart:convert';
import 'dart:io';
import 'package:genealogy_management/app/core/extension/date_format_extension.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';
import '../../../data/model/user.dart';

class EditBranchNoInfoApi extends BaseRemoteSource {
  String getFileExtension(String path) {
    int dotIndex = path.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < path.length - 1) {
      return path.substring(dotIndex + 1);
    }
    return "jpg";
  }

  Future<String?> editBranch({
    required int userGenealogyId,
    required int genealogyId,
    String? avatar,
    String? role,
    required String name,
    String? otherName,
    String? job,
    int? gender,
    DateTime? birthday,
    bool? alive,
    DateTime? death,
    String? graves,
    String? worship,
  }) async {
    final String? avatarToBase64;
    if (avatar != null) {
      final imagebytes = await File(avatar).readAsBytes();
      avatarToBase64 = base64.encode(imagebytes);
    } else {
      avatarToBase64 = null;
    }
    final data = {
      "avatar": avatarToBase64 != null
          ? "data:image/${getFileExtension(avatar!)};base64,$avatarToBase64"
          : null,
      "role": role,
      "name": name,
      "other_name": otherName,
      "gender": gender,
      "job_name": job,
      "birthday": birthday?.toFormattedDate2(),
      "is_dead": alive == true ? 0 : 1,
      "dead_at": death?.toFormattedDate2(),
      "burial_place": graves,
      "worship_place": worship
    };
    final request = dioClient.put(
        ApiUrlConstants.editBranch(genealogyId, userGenealogyId),
        data: data);
    try {
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getBranch({
    required int userGenealogyId,
    required int genealogyId,
  }) async {
    final request =
        dioClient.get(ApiUrlConstants.editBranch(genealogyId, userGenealogyId));
    try {
      return callApiWithErrorParser(request).then(
          (value) => User.fromJson(value.data["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> treeRequest({
    required int userGenealogyId,
    required int genealogyId,
  }) {
    final data = {
      "user_genealogy_id": userGenealogyId,
      "genealogy_id": genealogyId
    };
    final request = dioClient.post(ApiUrlConstants.treeRequest, data: data);
    try {
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
