import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/tree_detail_model.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';
import 'package:genealogy_management/app/modules/detail_jafa/api/tree_detail_api.dart';
import '../../../core/widgets/dialog/custom_dialog.dart';
import '../../../main_router.dart';
import '../../tree_view/view/tree_view.dart';
import '../repository/tree_detail_repository.dart';
import 'tree_detail_state.dart';

class TreeDetailCubit extends Cubit<TreeDetailState> {
  TreeDetailCubit(
    this._treeDetailRepository,
    this.idJafa,
    // ignore: prefer_const_constructors
  ) : super(TreeDetailState());

  final TreeDetailRepository _treeDetailRepository;
//final MockTreeDetailRepository _mockTreeDetailRepository;
  final int idJafa;
  bool _isLoading = false;

  void initData() {
    debugPrint('init$state');
    loadData(idJafa);
    checkHasData();
    debugPrint('state: $state');
  }

  checkHasData() async {
    emit(state.copyWith(hasInfoJaFa: true));
  }

  void changeModal() {
    if (state.showInviteFriends == true) {
      emit(state.copyWith(showInviteFriends: false));
    }
    emit(state.copyWith(showModal: !state.showModal!));
  }

  void changeShowInviteFriends() {
    if (state.showModal == true) {
      emit(state.copyWith(showModal: false));
    }
    emit(state.copyWith(showInviteFriends: !state.showInviteFriends!));
  }

  void toEditJafa(
    BuildContext context,
  ) {
    context.router.push(const TreeEditViewRoute());
  }

  Future<void> showdialog(BuildContext context, String title, String content,
      String nameButtonSubmit) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            content: content,
            onTap: () {
              deleteJafaFunc(10);
              // ignore: use_build_context_synchronously
              context.router.replaceAll([const HomeViewRoute()]);
            },
            title: title,
            nameButtonSubmit: nameButtonSubmit,
          );
        });
  }

  Future<void> loadData(int idJafa) async {
    emit(state.copyWith(showModal: false));
    emit(state.copyWith(showInviteFriends: false));
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    try {
      debugPrint('loadata$state');
      await Future.wait<void>([
        loadDataJaFa(idJafa),
      ]);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }

  void toTreeView(BuildContext context) async {
    await context.router.push(TreeViewRoute(
        idTree: state.treeDetail!.id!,
        roleId: 1,
        nameJafa: state.treeDetail!.name ?? ''));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => TreeView(idTree: state.treeDetail!.id!)));
  }

  Future<String> deleteJafaResponse(int idJafa) async {
    if (state.treeDetail!.totalMember! >= 1) {
      var api = await TreeDetailApi().deleteJafa(idJafa, true);
      debugPrint(api.toString());
      return api.toString();
    }
    var api = await TreeDetailApi().deleteJafa(idJafa, false);
    debugPrint(api.toString());
    return api.toString();
  }

  Future<void> deleteJafaFunc(int idJafa) async {
    String message = await deleteJafaResponse(idJafa);
    debugPrint(message);
    emit(state.copyWith(statusDeleteJafa: message));
  }

  Future<String> leaveJafaResponse(int idJafa) async {
    var api = await TreeDetailApi().leavingJafa(idJafa);
    debugPrint(api.toString());
    return api.toString();
  }

  Future<void> leaveJafaFunc(int idJafa) async {
    String message = await leaveJafaResponse(idJafa);
    debugPrint(message);
    emit(state.copyWith(statusDeleteJafa: message));
  }

  Future<void> loadDataJaFa(int idJafa) async {
    emit(state.copyWith(treeDetail: TreeDetailModel()));
    try {
      final treeDetailReponse =
          await _treeDetailRepository.getTreeDetail(idJafa);
      emit(state.copyWith(treeDetail: treeDetailReponse));
    } catch (e) {
      debugPrint('error--------------' + e.toString());
      emit(state.copyWith(showUserListError: e));
    }
  }
}
