import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/core/extension/date_format_extension.dart';
import 'package:flutter_firebase/app/core/extension/string_extention.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/model/gender.dart';
import '../repository/edit_branch_no_info_repository.dart';
import 'edit_branch_no_info_state.dart';

class EditBranchNoInfoCubit extends Cubit<EditBranchNoInfoState> {
  EditBranchNoInfoCubit(this._editBranchNoInfoRepository)
      : super(const EditBranchNoInfoState());

  final EditBranchNoInfoRepository _editBranchNoInfoRepository;

  void setAvatar(String avatar) {
    emit(state.copyWith(avatar: avatar));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
    name.isEmpty
        ? emit(state.copyWith(pass: false))
        : emit(state.copyWith(pass: true));
  }

  void setRole(String role) {
    emit(state.copyWith(role: role));
  }

  void setOtherName(String otherName) {
    emit(state.copyWith(otherName: otherName));
  }

  void setGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void setJob(String job) {
    emit(state.copyWith(job: job));
  }

  void setBirthday(String birthday) {
    emit(state.copyWith(birthday: birthday));
  }

  void setAlive(bool isAlive) {
    emit(state.copyWith(isAlive: isAlive));
  }

  void setDeath(String death) {
    emit(state.copyWith(death: death));
  }

  void setWorthShip(String worship) {
    emit(state.copyWith(worship: worship));
  }

  void setGraves(String graves) {
    emit(state.copyWith(graves: graves));
  }

  void setPass(bool pass) {
    emit(state.copyWith(pass: pass));
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

  void editBranch({
    required int userGenealogyId,
    required int genealogyId,
  }) async {
    try {
      emit(state.copyWith(saveDone: false));
      await _editBranchNoInfoRepository.editBranch(
          genealogyId: genealogyId,
          userGenealogyId: userGenealogyId,
          role: state.role,
          name: state.name,
          otherName: state.otherName,
          job: state.job,
          alive: state.isAlive,
          birthday: state.birthday?.toFormatDate(),
          death: state.death?.toFormatDate(),
          avatar: state.avatar != null
              ? (state.avatar!.contains("http") ? null : state.avatar!)
              : null,
          gender: state.gender.getGenderNumber(),
          graves: state.graves,
          worship: state.worship);
      emit(state.copyWith(saveDone: true));
    } catch (e) {
      if (e is StateError) {
        return;
      }
      emit(state.copyWith(error: e));
      rethrow;
    }
  }

  void getBranch({
    required int userGenealogyId,
    required int genealogyId,
  }) async {
    try {
      final user = await _editBranchNoInfoRepository.getBranch(
          genealogyId: genealogyId, userGenealogyId: userGenealogyId);
      if (user != null) {
        emit(state.copyWith(
            avatar: user.avatar,
            role: user.role,
            name: user.name ?? "",
            otherName: user.otherName,
            job: user.jobName,
            gender: user.gender?.getGender() ?? Gender.man,
            birthday: user.birthday?.toFormattedDate(),
            isAlive: user.isAlive ?? true,
            death: user.deadAt?.toFormattedDate(),
            worship: user.worshipplace,
            graves: user.burialPlace,
            initDone: true));
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      rethrow;
    }
  }
}
