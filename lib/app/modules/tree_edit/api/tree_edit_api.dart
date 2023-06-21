import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:genealogy_management/app/core/base/base_remote_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/api/api_hepler.dart';
import '../../../data/model/province.dart';
import '../../../data/model/tree.dart';
import '../../../flavors/build_config.dart';

final apiHelper = ApiHelper();

class TreeEditApi extends BaseRemoteSource {
  Future<Tree?> treeEdit({
    required String name,
    String? description,
    String? image,
    int? province,
    int? district,
    String? address,
    String? relationship,
  }) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "description": description,
      'image': image != null ? MultipartFile.fromFileSync(image) : null,
      'province_id': province,
      'district_id': district,
      'address': address,
      'relation_name': relationship,
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await apiHelper.post(
        path: '/api/genealogy',
        parameters: formData,
        token: prefs.getString('accessToken') ??
            "14|CKVWIhTJObHbmAAtQGyAZSgdZfb3xJ5Wdt017Sqw",
      );

      if (response.data['status']) {
        final treeJson = response.data['data'];

        final tree = Tree.fromJson(treeJson);
        return tree;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateJafa({
    required int id,
    required String name,
    String? description,
    String? image,
    String? province,
    String? district,
    String? address,
    String? relationship,
  }) async {
    debugPrint('ididididid' + id.toString());
    Map<String, dynamic>? formData = ({
      "name": name,
      "description": description,
      'image': image,
      'province_id': province,
      'district_id': district,
      'address': address,
      'relation_name': relationship,
    });
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.put('$baseUrl/api/genealogy/$id', data: formData);
    try {
      // return callApiWithErrorParser(request)
      //     .then((response) => List<TreeViewModel>.fromJson(response.data['data']));
      return await callApiWithErrorParser(request)
          .then((response) => response.data['message']);
      //return MockTreeDetailRepository().getTreeViewModel();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Province>> getProvinces() async {
    try {
      final response = await apiHelper.get(path: '/api/cities');

      List<Province> data = response.data['data']
          .map<Province>((n) => Province.fromJson(n))
          .toList();
      print(data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
