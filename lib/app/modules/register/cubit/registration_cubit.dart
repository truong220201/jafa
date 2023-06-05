import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    // ignore: unnecessary_null_comparison
    if (name != null) emit(state.copyWith(showHomePage: true));
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

  void verify(String phone, String verify, Function? success) {
    FirebaseManager.verifyPhoneNumber("+84${phone.substring(1)}",
        (verificationId, forceResendingToken) async {
      verify = verificationId;
      emit(state.copyWith(verificationId: verificationId));
      if (success != null) {
        success();
      }
    });
  }

  Future<void> credential(String verificationId, String otp, Function? success,
      Function? fail) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(userCredential: userCredential));
      if (success != null) {
        success();
      }
    } catch (e) {
      if (fail != null) {
        fail();
      }
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
