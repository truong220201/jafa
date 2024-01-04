import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/modules/tree_create/cubit/tree_create_state.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/tree_create_repository.dart';

class TreeCreateCubit extends Cubit<TreeCreateState> {
  TreeCreateCubit(this._treeCreateRepository) : super(const TreeCreateState());

  final TreeCreateRepository _treeCreateRepository;

  void setName(String name) {
    emit(state.copyWith(name: name));
    if (name != '') {
      emit(state.copyWith(pass: true));
    } else {
      emit(state.copyWith(pass: false));
    }
  }

  void setHistory(String history) {
    emit(state.copyWith(history: history));
  }

  void setAvatar(String avatar) {
    emit(state.copyWith(avatar: avatar));
  }

  void setDistrict(int district) {
    // emit(state.copyWith(district: district));
  }

  void setProvince(int province) {
    // emit(state.copyWith(province: province));
  }

  void setRelationship(String relationship) {
    emit(state.copyWith(relationship: relationship));
  }

  Future<void> chooseImageFromGallery() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(avatar: pickedFile.path));
      debugPrint(state.avatar);
    }
  }

  Future<void> takeImageFromCamera() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      emit(state.copyWith(avatar: pickedFile.path));
    }
  }

  void getProvinces() async {
    try {
      final provinces = await _treeCreateRepository.getProvinces();
      emit(state.copyWith(provinces: provinces));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> treeCreate() async {
    try {
      final tree = await _treeCreateRepository.treeCreate(
          name: state.name,
          description: state.history,
          image: state.avatar,
          address: state.address,
          relationship: state.relationship);
      debugPrint(tree.toString());
    } catch (e) {
      rethrow;
    }
  }
}
