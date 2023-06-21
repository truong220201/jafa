import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/tree_view_model.dart';
import '../../../network/exceptions/bad_request_exception.dart';
import '../repository/tree_view_repository.dart';
import 'tree_view_state.dart';

class TreeViewCubit extends Cubit<TreeViewState> {
  TreeViewCubit(this._treeViewRepository, this.idTree)
      : super(const TreeViewState());

  //final TreeViewRepository _treeViewRepository;
  final TreeViewRepository _treeViewRepository;
  final int idTree;
  bool _isLoading = false;

  void initData() {
    loadData();
    // initArray();
  }

  // void initArray() async {
  //   final List<TreeViewModel>? listTreeView = state.treeViewModel;
  //   List<Node> arr = [];
  //   List<Couple> arrCouple = [];
  //   for (int i = 0; i < listTreeView!.length; i++) {
  //     arr.add(Node.Id(listTreeView[i].id));
  //     // emit(state.copyWith(arrTree:  arrTree.add(Node.Id(listTreeView[i].id))));
  //   }

  //   emit(state.copyWith(arrTree: arr, arrCouple: arrCouple));
  // }
  void changeModal() {
    if (state.showSearch == true) {
      emit(state.copyWith(showSearch: false));
    }
    emit(state.copyWith(showModal: !state.showModal));
  }

  void changeShowSearch() {
    if (state.showModal == true) {
      emit(state.copyWith(showModal: false));
    }
    emit(state.copyWith(showSearch: !state.showSearch));
  }

  void changeAloneUser() {
    emit(state.copyWith(aloneUser: false));
  }

  void changeData() {
    emit(state.copyWith(hasData: true));
  }

  void setArrCouple(List<Couple> arrCouple) {
    emit(state.copyWith(arrCouple: arrCouple));
  }

  Future<void> loadData() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    try {
      await Future.wait<void>([
        loadDataJaFa(idTree),
      ]);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }

  Future<void> checkUser() async {
    if (state.treeViewModel!.isNotEmpty) {
      changeData();
      List<Couple> arrCouple = [];
      List<Couple> arrCoupleAdd = [];
      for (int i = 0; i < state.treeViewModel!.length; i++) {
        if (state.treeViewModel![i].childrenParrent.isNotEmpty) {
          changeAloneUser();
          for (int j = 0;
              j < state.treeViewModel![i].childrenParrent.length;
              j++) {
            if (state.treeViewModel![i].childrenParrent[j].relationType ==
                'couple') {
              arrCouple.add(Couple(
                  idaPerson: state.treeViewModel![i].id,
                  listIdvk: [state.treeViewModel![i].childrenParrent[j].id!]));
              // break;
            }
          }
        }
      }

      // debugPrint(arrCouple[0].listIdvk.toString());
      // debugPrint(arrCouple[1].listIdvk.toString());
      // debugPrint('arrCouple length :----------' + arrCouple.length.toString());
      for (int i = 0; i < arrCouple.length; i++) {
        // debugPrint('i:---' + i.toString());
        if (i >= 1) {
          // debugPrint(arrCouple[i].idaPerson.toString());
          // debugPrint(arrCouple[i - 1].idaPerson.toString());
          if (arrCouple[i].idaPerson == arrCouple[i - 1].idaPerson) {
            //logic o cho nay. van chua add vao arrCoupleAdd
            List<int> listvk = [];
            // debugPrint(
            //     'listvk khoi tao: ' + arrCouple[i - 1].listIdvk!.toString());
            listvk = [...arrCouple[i - 1].listIdvk!];
            // debugPrint('listvk:----------' + listvk.toString());
            // debugPrint('arrCouple[$i].listIdvk![0]:----------' +
            //     arrCouple[i].listIdvk![0].toString());
            listvk.add(arrCouple[i].listIdvk![0]);
            // debugPrint('listvk:----------' + listvk.toString());
            //
            if (listvk.length <= 2) {
              arrCoupleAdd.add(Couple(
                  idaPerson: arrCouple[i].idaPerson,
                  listIdvk: arrCouple[i].listIdvk));
              // debugPrint('arrCoupleAdd 2 phan tu:----------' +
              //     arrCoupleAdd.length.toString());
              // debugPrint(
              //     'arrCoupleAdd[${arrCoupleAdd.length - 1} ]:----------' +
              //         listvk.toString());
            } else {
              // arrCoupleAdd[arrCoupleAdd.length - 1] =
                  arrCoupleAdd[arrCoupleAdd.length - 1]
                      .copyWith(listIdvk: listvk);
              // debugPrint(
              //     'arrCoupleAdd[${arrCoupleAdd.length - 1} ]:----------' +
              //         listvk.toString());
            }
            //
            arrCouple[i] = arrCouple[i].copyWith(listIdvk: listvk);
          } else {
            // arrCoupleAdd.add(Couple(
            //     idaPerson: arrCouple[i].idaPerson,
            //     listIdvk: arrCouple[i].listIdvk));
            // debugPrint('arrCoupleAdd-----' + arrCoupleAdd.toString());
          }
        } else {
          // arrCoupleAdd.add(Couple(
          //     idaPerson: arrCouple[i].idaPerson,
          //     listIdvk: arrCouple[i].listIdvk));
          // debugPrint('arrCoupleAdd-----' + arrCoupleAdd.toString());
        }
      }

      // debugPrint(
      //     'arrCoupleAdd length :----------' + arrCoupleAdd.length.toString());
      // debugPrint(
      //     'test id cha 0 :----------' + arrCoupleAdd[0].idaPerson.toString());
      // debugPrint('test listvk cha 0 :----------' +
      //     arrCoupleAdd[0].listIdvk.toString());
      // debugPrint(
      //     'test id cha 1 :----------' + arrCoupleAdd[1].idaPerson.toString());
      // debugPrint('test listvk cha 1 :----------' +
      //     arrCoupleAdd[1].listIdvk.toString());
      // debugPrint(
      //     'test id cha 2 :----------' + arrCoupleAdd[2].idaPerson.toString());
      // debugPrint('test listvk cha 2 :----------' +
      //     arrCoupleAdd[2].listIdvk.toString());
      // debugPrint(
      //     'test id cha 3 :----------' + arrCoupleAdd[3].idaPerson.toString());
      // debugPrint('test listvk cha 3 :----------' +
      //     arrCoupleAdd[3].listIdvk.toString());
      // debugPrint(
      //     'arrCoupleAdd length :----------' + arrCouple.length.toString());
      // for (int q = 0; q < arrCoupleAdd.length; q++) {
      //   // if (arrCouple[q].idaPerson == state.treeViewModel![i].id) {
        // debugPrint(' arrCouple[$q]:' + arrCouple[q].listIdvk.toString());
        // debugPrint(' state.treeViewModel![$i]:' +
      //   //     state.treeViewModel![i].toString());
      //   // if (q + 1 >= arrCouple.length) {
      //   if (q >= 1) {
      //     if (arrCouple[q].idaPerson == arrCouple[q - 1].idaPerson) {
            // debugPrint(' state.treeViewModel![$i]:' +
      //       //     arrCouple[q].listIdvk!.toString());
      //       List<int> listvk = [];
      //       if (q >= 1) {
      //         listvk = [...arrCouple[q - 1].listIdvk!];
      //       } else {
      //         listvk = [...arrCouple[q].listIdvk!];
      //         continue;
      //       }

            // debugPrint(' arrCouple[q].listIdvk: add' + listvk.toString());
      //       // if (q == arrCouple.length) {
      //       //   break;
      //       // } else {
      //       listvk.add(arrCouple[q].listIdvk![0]);
            // debugPrint('listvk' + listvk.toString());
      //       arrCouple[q] = arrCouple[q].copyWith(listIdvk: listvk);
            // debugPrint(' arrCouple[$q].listIdvk: last' +
      //           arrCouple[q].listIdvk.toString());
      //       // if (arrCoupleAdd.length > 1) {
      //       //   for (int i = 0; i < arrCoupleAdd.length; i++) {
      //       //     if (i + 1 < arrCoupleAdd.length) {
      //       //       if (arrCoupleAdd[i].idaPerson ==
      //       //           arrCoupleAdd[i + 1].idaPerson) {
      //       //         arrCoupleAdd[i].copyWith(
      //       //             idaPerson: arrCouple[q].idaPerson,
      //       //             listIdvk: listvk);
      //       //       }
      //       //       arrCoupleAdd.add(Couple(
      //       //           idaPerson: arrCouple[q].idaPerson, listIdvk: listvk));
      //       //     } else {
      //       //       arrCoupleAdd.add(Couple(
      //       //           idaPerson: arrCouple[q].idaPerson, listIdvk: listvk));
      //       //     }
      //       //   }
      //       // }
      //       // arrCoupleAdd.add(Couple(
      //       //     idaPerson: arrCouple[q].idaPerson, listIdvk: listvk));
      //       // }
      //       // }
      //     }

      //     // }
      //   }
      // }
      setArrCouple(arrCoupleAdd);
      // debugPrint('length----------' + arrCoupleAdd.length.toString());
    }
  }

  TreeViewModel getinfPerSon(int id) {
    TreeViewModel? infPerSon;
    for (var i in state.treeViewModel!) {
      if (i.id == id) {
        infPerSon = i;
      }
    }
    return infPerSon ?? const TreeViewModel();
  }

  List<TreeViewModel> getinfListPerSon(List<int> idList) {
    List<TreeViewModel> listInf = [];
    for (var i in state.treeViewModel!) {
      for (int j = 0; j < idList.length; j++) {
        if (i.id == idList[j]) {
          listInf.add(i);
        }
      }
    }
    return listInf;
  }

  Future<void> loadDataJaFa(int id) async {
    emit(state.copyWith(isLoading: true, treeViewModel: [], arrCouple: []));

    List<TreeViewModel> listModel =
        await _treeViewRepository.getTreeViewDetail(id);
    // debugPrint('listtttt=======' + listModel.toString());

    emit(state.copyWith(
      treeViewModel: listModel,
    ));
    await checkUser();
    emit(state.copyWith(isLoading: false));
  }

  // void treeRequest({
  //   required int userGenealogyId,
  //   required int genealogyId,
  // }) async {
  //   try {
  //     emit(state.copyWith(requestDone: false));
  //     final message = await _treeViewRepository.treeRequest(
  //         genealogyId: genealogyId, userGenealogyId: userGenealogyId);
  //     emit(state.copyWith(messageTreeRequest: message, requestDone: true));
  //   } catch (e) {
  //     if (e is BadRequestException) {
  //       emit(state.copyWith(messageTreeRequest: e.message, requestDone: true));
  //       return;
  //     }
  //     emit(state.copyWith(error: e, requestDone: false));
  //     rethrow;
  //   }
  // }
}
