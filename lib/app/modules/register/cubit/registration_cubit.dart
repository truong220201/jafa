import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/extension/string_extention.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/firebase_manager.dart';
import '../../../core/values/regexp_constant.dart';
import '../../../data/model/gender.dart';
import '../models/user_model.dart';
import '../repository/registration_repository.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._registrationRepository)
      : super(const RegistrationState());

  final RegistrationRepository _registrationRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setPhone(String phone) {
    if (RegexpConstants.phoneNumber.hasMatch(phone)) {
      emit(state.copyWith(phonePass: true));
    } else {
      emit(state.copyWith(phonePass: false));
    }
    emit(state.copyWith(phone: phone));
  }

  void setPhonePass(bool bool) {
    emit(state.copyWith(phonePass: bool));
  }

  void setConfirmPass(bool bool) {
    emit(state.copyWith(confirmCodePass: bool));
  }

  void setShowHomePage(bool bool) {
    emit(state.copyWith(showHomePage: bool));
  }

  void setConfirmCode(String confirmCode) {
    if (RegexpConstants.otp.hasMatch(confirmCode)) {
      emit(state.copyWith(confirmCodePass: true, confirmCode: confirmCode));
    } else {
      emit(state.copyWith(confirmCodePass: false, confirmCode: confirmCode));
    }
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
    if (name.isNotEmpty) {
      emit(state.copyWith(showHomePage: true));
    } else {
      emit(state.copyWith(showHomePage: false));
    }
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void setBirthday(String birthday) {
    emit(state.copyWith(birthday: birthday));
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

  Future<void> login() async {
    try {
      final user = await _registrationRepository.login(fUid: state.fUid);
      user != null
          ? emit(state.copyWith(hasUser: true))
          : emit(state.copyWith(hasUser: false));
      print(state.hasUser);
    } catch (e) {
      if (e is Exception && e.toString().contains("400")) {
        emit(state.copyWith(hasUser: false));
      } else {
        rethrow;
      }
    }
  }

  Future<void> register() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _registrationRepository.register(
          fUid: state.fUid,
          name: state.name,
          phone: state.phone,
          birthday:
              (state.birthday != null) ? state.birthday!.toFormatDate() : null,
          avatar: state.avatar,
          gender: state.gender.getGenderNumber());
      emit(state.copyWith(isLoading: false));
      print(user.toString());
    } catch (e) {
      rethrow;
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

  void verify(String phone, Function? success) {
    FirebaseManager.verifyPhoneNumber("+84${phone.substring(1)}",
        (verificationId, forceResendingToken) async {
      emit(state.copyWith(verificationId: verificationId));
      if (success != null) {
        success();
      }
    });
  }

  Future<void> credential(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: state.verificationId!, smsCode: otp);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      emit(state.copyWith(fUid: userCredential.user!.uid));
      emit(state.copyWith(checkOtp: true));
      emit(state.copyWith(userCredential: userCredential));
    } catch (e) {
      if (e is FirebaseAuthException && e.code == "session-expired") {
        emit(state.copyWith(expireOtp: true));
      }
      emit(state.copyWith(checkOtp: false));
    }
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
