import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/time_line_model.dart';
import 'package:genealogy_management/app/modules/tree_by_list/cubit/tree_by_list_state.dart';

import '../repository/tree_by_list_repository.dart';

class TreeByListCubit extends Cubit<TreeByListState> {
  TreeByListCubit(this._treeByListRepository, this.idJafa)
      : super(const TreeByListState());

  final TreeByListRepository _treeByListRepository;
  final int idJafa;

  void initData() {
    loadData(idJafa);
  }

  void loadData(int idJafa) async {
    emit(state.copyWith(isLoading: true));
    List<TimeLine> listTimeLine =
        await _treeByListRepository.getListTimeLine(idJafa);
    emit(state.copyWith(timeLine: listTimeLine, idJafa: idJafa));
    debugPrint('all list : ---------' + state.timeLine.toString());
    emit(state.copyWith(isLoading: false));
  }
}
