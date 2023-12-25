import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/detail_jafa/api/tree_detail_api.dart';
import 'package:genealogy_management/app/modules/detail_jafa/views/tree_detail_view.dart';
import 'package:genealogy_management/app/modules/tree_create/cubit/tree_create_state.dart';
import 'package:genealogy_management/app/modules/tree_edit/cubit/tree_edit_state.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/tree_edit_repository.dart';

class TreeEditCubit extends Cubit<TreeEditState> {
  TreeEditCubit(this._treeEditRepository) : super(const TreeEditState());

  final TreeEditRepository _treeEditRepository;

  void setName(String name) {
    emit(state.copyWith(name: name));
    if (name != '') {
      emit(state.copyWith(pass: true));
    } else {
      emit(state.copyWith(pass: false));
    }
  }

  void getProvinces() async {
    try {
      final provinces = await _treeEditRepository.getProvinces();
      emit(state.copyWith(provinces: provinces));
    } catch (e) {
      rethrow;
    }
  }

  void setHistory(String history) {
    emit(state.copyWith(history: history));
  }

  void setAvatar(String avatar) {
    emit(state.copyWith(avatar: avatar));
  }

  void setDistrict(String district) {
    emit(state.copyWith(district: district));
  }

  void setProvince(String province) {
    emit(state.copyWith(province: province));
  }

  void setRelationship(String relationship) {
    emit(state.copyWith(relationship: relationship));
  }

  void toDetailJafa(
    BuildContext context,
  ) {
    context.router.pop();
  }

  Future<void> chooseImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(avatar: pickedFile.path));
    }
  }

  Future<void> takeImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      emit(state.copyWith(avatar: pickedFile.path));
    }
  }

  Future<void> treeEdit(BuildContext context) async {
    try {
      String? tree;
      await _treeEditRepository
              .treeEdit(
                  id: state.id,
                  name: state.name,
                  description: state.history,
                  image: state.avatar,
                  province: state.province,
                  district: state.district,
                  address: state.address,
                  relationship: state.relationship)
              .then((value) => tree = value) ??
          '';
      // final message = await tree;
      // if()
      emit(state.copyWith(
          message: tree ?? 'Bạn Không có quyền chỉnh sửa gia tộc này'));
      // ignore: use_build_context_synchronously
      toDetailJafa(context);
      debugPrint('baab---$tree');
    } catch (e) {
      rethrow;
    }
  }
}
