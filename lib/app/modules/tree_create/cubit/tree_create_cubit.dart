import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/tree_create/cubit/tree_create_state.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/tree_create_repository.dart';

class TreeCreateCubit extends Cubit<TreeCreateState> {
  TreeCreateCubit(this._TreeCreateRepository)
      : super(const TreeCreateState());

  final TreeCreateRepository _TreeCreateRepository;

  void setName(String name) {
    emit(state.copyWith(name: name));
    if(name!='') {
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

  void setAddress(String province) {
    emit(state.copyWith(province: province));
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

  Future<void> chooseImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(state.copyWith(avatar: pickedFile.path));
      print(state.avatar);
    }
  }

  Future<void> takeImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      emit(state.copyWith(avatar: pickedFile.path));
    }
  }
}
