import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/api/api_hepler.dart';
import '../../../data/model/province.dart';
import '../../../data/model/tree.dart';

final apiHelper = ApiHelper();

class TreeCreateApi {
  Future<Tree?> treeCreate({
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
