import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user_model.dart';
import '../repository/registration_repository.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._registrationRepository)
      : super(const RegistrationState());

  final RegistrationRepository _registrationRepository;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setPhone(String phone) {
    if (RegExp(
            r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$")
        .hasMatch(phone)) {
      emit(state.copyWith(phonePass: true));
    } else {
      emit(state.copyWith(phonePass: false));
    }
    emit(state.copyWith(phone: phone));
  }

  void setConfirmCode(String confirmCode) {
    if (RegExp(r"^\d{6}$").hasMatch(confirmCode)) {
      emit(state.copyWith(confirmCodePass: true, confirmCode: confirmCode));
    } else {
      emit(state.copyWith(confirmCodePass: false, confirmCode: confirmCode));
    }
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
    // ignore: unnecessary_null_comparison
    if (name != null) emit(state.copyWith(showHomePage: true));
  }

  void setGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void setBirthday(String birthday) {
    emit(state.copyWith(birthday: birthday));
  }

  initData(RegistrationState registrationState) {
    emit(state.copyWith(
      userModel: registrationState.userModel,
      phone: registrationState.phone,
      avatar: registrationState.avatar,
      gender: registrationState.gender,
      name: registrationState.name,
      birthday: registrationState.birthday,
      confirmCodePass: true,
      showHomePage: true,
    ));
  }

  void setUserModel(UserModel user) {
    emit(state.copyWith(userModel: user));
  }

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "id": user.id,
        "name": user.name,
        "avatar": user.avatar,
        "phone": user.phone,
        "gender": user.gender,
        "birthday": user.birthday
      });
    } catch (e) {
      print(e);
    }
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

  initPass() {
    emit(state.copyWith(phonePass: true));
  }

  // Future<List<String>> getFilePaths() async {
  //   List<String> filePaths = [];

  //   List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
  //   if (paths.isNotEmpty) {
  //     AssetPathEntity cameraPath = paths.first;
  //     List<AssetEntity> assets = await cameraPath.getAssetListPaged(
  //         page: 0, size: await cameraPath.assetCountAsync);

  //     for (AssetEntity asset in assets) {
  //       if (asset.type == AssetType.image) {
  //         File? file = await asset.file;
  //         if (file != null) {
  //           filePaths.add(file.path);
  //         }
  //       }
  //     }
  //   }

  //   return filePaths;
  // }

  // initImageList(RegistrationState registrationState) async {
  //   final list = await getFilePaths();
  //   emit(state.copyWith(imageList: list));
  //   emit(state.copyWith(showImageLoading: true));
  //   initData(registrationState);
  //   print(registrationState.toString());
  // }
}
