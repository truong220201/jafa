import 'package:genealogy_management/app/data/model/jafa_model.dart';

import 'home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<List<JafaModel>> getHomeDetail() {
    // TODO: implement getHomeDetail
    throw UnimplementedError();
  }
}
