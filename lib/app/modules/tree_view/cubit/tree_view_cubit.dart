import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import '../repository/tree_view_repository.dart';
import 'tree_view_state.dart';

class TreeViewCubit extends Cubit<TreeViewState> {
  TreeViewCubit(this._treeViewRepository, this.idTree)
      : super(const TreeViewState());

  //final TreeViewRepository _treeViewRepository;
  final TreeViewRepository _treeViewRepository;
  final String idTree;
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

  void changeSearchLocation(Offset searchLocation) {
    debugPrint(searchLocation.toString());
    emit(state.copyWith(searchPosition: searchLocation));
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

  Future<void> addName() async {
    List<TreeViewModel> arrNameUser = [];
    for (int i = 0; i < state.treeViewModel!.length; i++) {
      debugPrint('i${state.treeViewModel![i].name}');
      if (state.treeViewModel![i].name != null) {
        arrNameUser.add(state.treeViewModel![i]);
      }
    }
    emit(state.copyWith(listName: arrNameUser));
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

  void addToNode(List<UserNode> listNode) async {
    emit(state.copyWith(nodeList: listNode));
    // await addAllNode();
  }

  // Future<void> addAllNode() async {

  //   // debugPrint('state couple-----------------------------' +
  //   //     state.arrCouple.toString());
  //   List<UserNode> allNodeHus = [];
  //   // List<UserNode> allNode = state.nodeList!;
  //   for (Couple couple in state.arrCouple!) {
  //     debugPrint(state.nodeList.toString());
  //     for (UserNode nodeUser in state.nodeList!) {
  //       debugPrint(
  //           'couple:' + couple.toString() + 'nodeUser:' + nodeUser.toString());
  //       if (nodeUser.userId! == couple.idaPerson) {
  //         for (int idHusband in couple.listIdvk!) {
  //           UserNode nodeHusAdd = UserNode(
  //               userId: idHusband, userPosition: nodeUser.userPosition);
  //           allNodeHus.add(nodeHusAdd);
  //         }
  //       }
  //     }
  //   }
  //   List<UserNode> allNode = new List.from(state.nodeList!)..addAll(allNodeHus);
  //   debugPrint(allNode.length.toString());
  //   emit(state.copyWith(nodeList: allNode));
  //   // allNode = allNode.add(...allNodeHus);
  // }

//search
  Offset userLocation(String keyUser) {
    Offset userLocation = const Offset(0, 0);

    for (UserNode nodeUser in state.nodeList!) {
      // ignore: unrelated_type_equality_checks

      if (nodeUser.userId == keyUser) {
        userLocation = nodeUser.userPosition!;
      }
    }
    return userLocation;
  }

//
//zoom
  void zoomToPosition(
      Offset position, TransformationController transformationController) {
// Tỷ lệ phóng to
    debugPrint(position.toString());
    // _transformationController.value = Matrix4.identity()
    //   ..scale(scale)
    //   ..translate(position.dx * (1 - scale), position.dy * (1 - scale));
    transformationController.value =
        Matrix4.translationValues(-position.dx, -position.dy, 0);
  }

//
  TreeViewModel getinfPerSon(String id) {
    TreeViewModel? infPerSon;
    for (var i in state.treeViewModel!) {
      if (i.id == id) {
        infPerSon = i;
      }
    }
    return infPerSon ?? const TreeViewModel();
  }

  List<TreeViewModel> getinfListPerSon(List<String> idList) {
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

//get main user location
  void getMainUserLocation(TransformationController transformationController) {
    for (TreeViewModel user in state.listName!) {
      if (user.self == true) {
        for (UserNode userNode in state.nodeList!) {
          if (user.id == userNode.userId) {
            zoomToPosition(userNode.userPosition!, transformationController);
          }
        }
      }
    }
  }
//

  Future<void> loadDataJaFa(String id) async {
    emit(state.copyWith(isLoading: true, treeViewModel: [], arrCouple: []));

    List<TreeViewModel> listModel =
        await _treeViewRepository.getTreeViewDetail(id);
    // debugPrint('listtttt=======' + listModel.toString());

    emit(state.copyWith(
      treeViewModel: listModel,
    ));
    await checkUser();
    await addName();
    // addAllNode();
    // debugPrint('-------------------==============' + state.listName.toString());
    emit(state.copyWith(isLoading: false));
  }

  void treeRequest({
    required String userGenealogyId,
    required String genealogyId,
  }) async {
    try {
      emit(state.copyWith(requestDone: false));
      final message = await _treeViewRepository.treeRequest(
          genealogyId: genealogyId, userGenealogyId: userGenealogyId);
      emit(state.copyWith(messageTreeRequest: message, requestDone: true));
    } catch (e) {
      // if (e is BadRequestException) {
      //   emit(state.copyWith(messageTreeRequest: e.message, requestDone: true));
      //   return;
      // }
      emit(state.copyWith(error: e, requestDone: false));
      rethrow;
    }
  }

// ----------------------------------------------
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
                  idaPerson: state.treeViewModel![i].childrenParrent[j].id,
                  listIdvk: [state.treeViewModel![i].id!]));
              // break;
            }
          }
        }
      }

      // debugPrint(arrCouple[0].listIdvk.toString());
      // debugPrint(arrCouple[1].listIdvk.toString());
      // debugPrint('arrCouple length :----------${arrCouple.length}');
      for (int i = 0; i < arrCouple.length; i++) {
        debugPrint('i:---$i');
        if (i >= 1) {
          // debugPrint(arrCouple[i].idaPerson.toString());
          // debugPrint(arrCouple[i - 1].idaPerson.toString());
          if (arrCouple[i].idaPerson == arrCouple[i - 1].idaPerson) {
            //logic o cho nay. van chua add vao arrCoupleAdd
            List<String> listvk = [];
            //debugPrint('listvk khoi tao: ${arrCouple[i - 1].listIdvk!}');
            listvk = [...arrCouple[i - 1].listIdvk!];
            debugPrint('listvk:----------$listvk');
            debugPrint(
                'arrCouple[$i].listIdvk![0]:----------${arrCouple[i].listIdvk![0]}');
            listvk.add(arrCouple[i].listIdvk![0]);
            debugPrint('listvk:----------$listvk');

            if (listvk.length <= 2) {
              arrCoupleAdd.add(Couple(
                  idaPerson: arrCouple[i].idaPerson,
                  listIdvk: arrCouple[i].listIdvk));
              debugPrint(
                  'arrCoupleAdd 2 phan tu:----------${arrCoupleAdd.length}');
              debugPrint(
                  'arrCoupleAdd[${arrCoupleAdd.length - 1} ]:----------$listvk');
            } else {
              arrCoupleAdd[arrCoupleAdd.length - 1] =
                  arrCoupleAdd[arrCoupleAdd.length - 1]
                      .copyWith(listIdvk: listvk);
              debugPrint(
                  'arrCoupleAdd[${arrCoupleAdd.length - 1} ]:----------$listvk');
            }
            //
            arrCouple[i] = arrCouple[i].copyWith(listIdvk: listvk);
          } else {
            // arrCoupleAdd.add(Couple(
            //     idaPerson: arrCouple[i].idaPerson,
            //     listIdvk: arrCouple[i].listIdvk));
            debugPrint('arrCoupleAdd-----$arrCoupleAdd');
          }
        } else if (i == 0) {
          //
          arrCoupleAdd.add(Couple(
              idaPerson: arrCouple[i].idaPerson,
              listIdvk: arrCouple[i].listIdvk));
          // debugPrint('arrCoupleAdd-----' + arrCoupleAdd.toString());
        }
        // arrCoupleAdd.add(Couple(
        //     idaPerson: arrCouple[i].idaPerson,
        //     listIdvk: arrCouple[i].listIdvk));
        // debugPrint('arrCoupleAdd-----' + arrCoupleAdd.toString());
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
}
