import '../../../data/model/province.dart';
import '../../../data/model/time_line_model.dart';
import '../../../data/model/tree.dart';
import '../api/tree_by_list_api.dart';

class TreeByListRepository {
  final TreeByListApi _api;

  TreeByListRepository(this._api);
 Future<List<TimeLine>>  getListTimeLine(int idJafa) {
    return _api.getListTimeLine(idJafa);
  }
}
