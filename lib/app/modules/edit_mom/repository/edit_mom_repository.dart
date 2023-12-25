import '../api/edit_mom_api.dart';

class EditMomRepository {
  final EditMomApi _editMomApi;

  EditMomRepository(this._editMomApi);

  Future<String?> changeMom({
    required int userGenealogyId,
    required int genealogyId,
  }) {
    try {
      return _editMomApi.changeMom(
          userGenealogyId: userGenealogyId, genealogyId: genealogyId);
    } catch (e) {
      rethrow;
    }
  }
}
