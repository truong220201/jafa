import 'package:genealogy_management/app/data/model/user_model.dart';

import '../../../../../data/model/tree_detail_model.dart';

class MockTreeDetailRepository {
  TreeDetailModel _treeDetail = const TreeDetailModel();
  @override
  Future<TreeDetailModel> getTreeDetailModel() async {
    _treeDetail = const TreeDetailModel(
        user: UserModel(name: 'Trần Viết Gia', content: 'Nhà Ngoại bên mẹ'),
        familyInfo: '9 Đời 200 Thành viên',
        familyInfoContent:
            'Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi.',
        imageUrl:
            'https://kenh14cdn.com/thumb_w/660/2020/5/28/0-1590653959375414280410.jpg');
    return _treeDetail;
  }
}
