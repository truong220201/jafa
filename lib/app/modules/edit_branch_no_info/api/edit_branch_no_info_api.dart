import 'dart:convert';
import 'dart:io';
import 'package:flutter_firebase/app/core/extension/date_format_extension.dart';
import '../../../core/values/api_url_constant.dart';
import '../../../data/model/user.dart';

class EditBranchNoInfoApi {
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
    return '';
  }

  Future<User?> getBranch({
    required int userGenealogyId,
    required int genealogyId,
  }) async {
    return User();
  }

  Future<String?> treeRequest({
    required int userGenealogyId,
    required int genealogyId,
  }) async {
    return '';
  }
}
