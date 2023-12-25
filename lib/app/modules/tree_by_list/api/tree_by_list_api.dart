import '../../../core/base/base_remote_source.dart';
import '../../../data/model/time_line_model.dart';
import '../../../flavors/build_config.dart';

class TreeByListApi extends BaseRemoteSource {
  Future<List<TimeLine>> getListTimeLine(int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.get(
      '$baseUrl/api/tree/$idJafa/list',
    );
    try {
      return callApiWithErrorParser(request).then((response) =>
          (response.data['data'] as List)
              .map<TimeLine>((value) => TimeLine.fromMap(value))
              .toList());
    } catch (e) {
      rethrow;
    }
  }
}
