import 'package:genealogy_management/app/data/model/jafa_model.dart';

import 'home_repository.dart';

class MockHomeRepository implements HomeRepository {
  List<JafaModel> _listJafaModel = [];
  @override
  Future<List<JafaModel>> getJafaModel() async {
    _listJafaModel = [
      JafaModel(name: 'Phoenix', content: 'Nhà Ngoại bên mẹ'),
      JafaModel(name: 'Phạm Thế Gia', content: 'Nhà Nội bên bố'),
      JafaModel(
          name: 'Nguyễn Gia', content: 'Chưa điền quan hệ với gia tộc này'),
    ];
    return _listJafaModel;
  }
}
