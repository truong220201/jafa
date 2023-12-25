import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';

import '../../../data/model/member_info_model.dart';
import '../repository/member_info_repository.dart';
import 'member_info_state.dart';

class MemberInfoCubit extends Cubit<MemberInfoState> {
  MemberInfoCubit(
      this._memberInfoRepository, this.idJafa, this.idMember, this.roleId)
      : super(const MemberInfoState());

  final MemberInfoRepository _memberInfoRepository;
  final int idJafa;
  final int idMember;
  final int roleId;
  bool _isLoading = false;

  void initData() {
    //debugPrint('init' + state.toString());

    loadData();
    //checkHasUser();
    //debugPrint('state: ' + state.toString());
  }

  Future<void> loadData() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    try {
      await Future.wait<void>([
        loadDataJaFa(),
      ]);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }

  void checkAdmin(int idRole) {
    if (idRole == 1) {
      emit(state.copyWith(showModalmenu: true));
    }
  }

  Future<void> loadDataJaFa() async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(memberInfo: const MemberInfoModel()));
    MemberInfoModel memberInfo =
        await _memberInfoRepository.getMemberInfoDetail(idJafa, idMember);

    emit(state.copyWith(
      memberInfo: MemberInfoModel(
          name: memberInfo.name ?? 'Chưa điền thông tin',
          otherName: memberInfo.otherName ?? 'Chưa điền thông tin',
          gender: memberInfo.gender ?? 'Chưa điền thông tin',
          birthday: memberInfo.birthday ?? 'Chưa điền thông tin',
          jobName: memberInfo.jobName ?? 'Chưa điền thông tin'),
    ));
    checkAdmin(roleId);
    debugPrint('done!------------');
    emit(state.copyWith(isLoading: false));
  }
}
