import 'package:genealogy_management/app/data/model/user_model.dart';

import 'home_repository.dart';

class MockHomeRepository implements HomeRepository {
  List<UserModel> _listUserModel = [];
  @override
  Future<List<UserModel>> getUserModel() async {
    _listUserModel = [
      UserModel(name: 'Phoenix', content: 'Nhà Ngoại bên mẹ'),
      UserModel(name: 'Phạm Thế Gia', content: 'Nhà Nội bên bố'),
      UserModel(
          name: 'Nguyễn Gia', content: 'Chưa điền quan hệ với gia tộc này'),
    ];
    return _listUserModel;
  }
}
