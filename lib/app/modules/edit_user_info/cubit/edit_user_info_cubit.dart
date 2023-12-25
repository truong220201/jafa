import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/extension/date_format_extension.dart';
import 'package:genealogy_management/app/core/extension/string_extention.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/model/gender.dart';
import '../../../data/model/user.dart';
import '../repository/edit_user_info_repository.dart';
import 'edit_user_info_state.dart';

class EditUserInfoCubit extends Cubit<EditUserInfoState> {
  EditUserInfoCubit(this._editUserInfoRepository)
      : super(const EditUserInfoState());

  final EditUserInfoRepository _editUserInfoRepository;

  void setName(String name) {
    emit(state.copyWith(name: name));
    name.isEmpty
        ? emit(state.copyWith(validateDone: false))
        : emit(state.copyWith(validateDone: true));
  }

  void setOtherName(String otherName) {
    emit(state.copyWith(otherName: otherName));
  }

  void setJob(String job) {
    emit(state.copyWith(job: job));
  }

  void setBirthday(String birthday) {
    emit(state.copyWith(birthday: birthday));
  }

  void initData(User user) {
    emit(state.copyWith(initDone: false));
    emit(state.copyWith(
      user: user,
      name: user.name ?? "",
      otherName: user.otherName,
      job: user.jobName,
      gender: user.gender?.getGender() ?? Gender.woman,
      birthday: user.birthday?.toFormattedDate(),
      phone: user.phone,
      email: user.email,
      avatar: user.avatar,
      initDone: true,
    ));
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void setPhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
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

  void saveData() {
    try {
      emit(state.copyWith(saveDone: false));
      final response = _editUserInfoRepository.editInfo(
        name: state.name,
        otherName: state.otherName,
        avatar: state.avatar,
        job: state.job,
        gender: state.gender.getGenderNumber(),
        birthday: state.birthday?.toFormatDate(),
        phone: state.phone,
        email: state.email,
      );
      emit(state.copyWith(saveDone: true));
      print(response);
    } catch (e) {
      rethrow;
    }
  }
}
