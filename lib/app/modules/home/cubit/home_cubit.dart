import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';

import '../repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._homeRepository,
  ) : super(const HomeState());

  final HomeRepository _homeRepository;
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

  Future<void> loadDataJaFa() async {
    emit(state.copyWith(isLoading: true));

    List<JafaModel> listModel = await _homeRepository.getHomeDetail();

    emit(state.copyWith(
      userList: listModel,
    ));
    emit(state.copyWith(isLoading: false));
  }
}
