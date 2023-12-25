import 'dart:convert';
import 'dart:io';
import 'package:genealogy_management/app/core/extension/date_format_extension.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';

class EditUserInfoApi extends BaseRemoteSource {
  String getFileExtension(String path) {
    int dotIndex = path.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex < path.length - 1) {
      return path.substring(dotIndex + 1);
    }
    return "jpg";
  }

  Future<String?> editInfo({
    required String name,
    String? otherName,
    String? phone,
    int? gender,
    String? avatar,
    DateTime? birthday,
    String? job,
    String? email,
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
      "name": name,
      "other_name": otherName,
      'gender': gender,
      'phone': phone,
      'birthday': birthday?.toFormattedDate2(),
      'job': job,
      'email': email,
    };
    final request = dioClient.put(ApiUrlConstants.editInfo, data: data);
    try {
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
