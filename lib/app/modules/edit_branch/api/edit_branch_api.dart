import 'dart:convert';
import 'dart:io';

import '../../../data/model/user.dart';

class EditBranchApi {
  String getFileExtension(String path) {
    int dotIndex = path.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < path.length - 1) {
      return path.substring(dotIndex + 1);
    }
    return "jpg";
  }

  Future<String?> editBranch({
    required String userGenealogyId,
    required String genealogyId,
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
      "birthday": birthday,
      "is_dead": alive == true ? 0 : 1,
      "dead_at": death,
      "burial_place": graves,
      "worship_place": worship
    };
    return '';
  }

  Future<User?> getBranch({
    required String userGenealogyId,
    required String genealogyId,
  }) async {
    return User();
  }
}
