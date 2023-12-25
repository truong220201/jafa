import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';
import 'package:genealogy_management/app/data/model/member_model.dart';

import '../repository/select_member_to_branch_repository.dart';
import 'select_member_to_branch_state.dart';

class SelectMemberToBranchCubit extends Cubit<SelectMemberToBranchState> {
  SelectMemberToBranchCubit(this._selectMemberToBranchRepository, this.idJafa)
      : super(const SelectMemberToBranchState());

  final SelectMemberToBranchRepository _selectMemberToBranchRepository;
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
    //emit(state.copyWith(searchList: listSearch));
  }
  Future<void> invMemberToTree(int index, int idMember) async {
    debugPrint('id index: ' +
        index.toString() +
        '-----id member: ' +
        idMember.toString());
    emit(state.copyWith(idMemberChoose: idMember, indexChoose: index));
    debugPrint('done!');
  }

  Future<void> loadDataJaFa() async {
    emit(state.copyWith(isLoading: true));
    ListMemberModel listDetailMember =
        await _selectMemberToBranchRepository.getListDetailMember(idJafa);

    // List<MemberModel> listAdmin = listDetailMember.admins ?? [];

    // List<MemberModel> listMember = listDetailMember.members ?? [];
    List<MemberModel> listViewer = listDetailMember.admins ?? [];
    // List<MemberModel> allUser = allMember(listAdmin, listMember, listViewer);
    emit(state.copyWith(allUser: listViewer));
    debugPrint('all list : ---------${state.allUser}');
    emit(state.copyWith(isLoading: false));
  }
}
