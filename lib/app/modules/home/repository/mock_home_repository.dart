import 'package:flutter_firebase/app/data/model/jafa_model.dart';

import 'home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<List<JafaModel>> getHomeDetail() {
    throw UnimplementedError();
  }
}
