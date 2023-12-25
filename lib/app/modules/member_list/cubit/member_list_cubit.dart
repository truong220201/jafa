import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';
import 'package:genealogy_management/app/data/model/member_model.dart';

import '../repository/member_list_repository.dart';
import 'member_list_state.dart';

class MemberListCubit extends Cubit<MemberListState> {
  MemberListCubit(this._memberListRepository, this.idJafa)
      : super(const MemberListState());

  final MemberListRepository _memberListRepository;
  final int idJafa;
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

  void changeShowInviteFriends() {
    emit(state.copyWith(showInviteFriends: !state.showInviteFriends!));
  }

  List<MemberModel> allMember(List<MemberModel> listAdmin,
      List<MemberModel> listMember, List<MemberModel> listViewer) {
    List<MemberModel> listAll =
        [listAdmin, listMember, listViewer].expand((x) => x).toList();
    return listAll;
  }

  void changeSearch(List<MemberModel> listSearch) {
    emit(state.copyWith(searchList: listSearch));
  }

  Future<void> loadDataJaFa() async {
    emit(state.copyWith(isLoading: true));
    ListMemberModel listDetailMember =
        await _memberListRepository.getListDetailMember(idJafa);

    List<MemberModel> listAdmin = listDetailMember.admins ?? [];

    List<MemberModel> listMember = listDetailMember.members ?? [];
    List<MemberModel> listViewer = listDetailMember.viewer ?? [];
    List<MemberModel> allUser = allMember(listAdmin, listMember, listViewer);
    emit(state.copyWith(
        adminlist: listAdmin,
        memberJafaList: listMember,
        userViewlist: listViewer,
        allUser: allUser,
        idJafa: idJafa));
    debugPrint('all list : ---------' + state.allUser.toString());
    debugPrint('admin list : ---------' + state.adminlist.toString());
    debugPrint('member list : ---------' + state.memberJafaList.toString());
    debugPrint('viewer list : ---------' + state.userViewlist.toString());
    emit(state.copyWith(isLoading: false));
  }
}
