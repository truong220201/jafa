import '../api/edit_couple_api.dart';

class EditCoupleRepository {
  final EditCoupleApi _editCoupleApi;

  EditCoupleRepository(this._editCoupleApi);

  Future<String?> changeCouple({
    required int memberId,
    required int genealogyId,
    required String ids,
  }) {
    try {
      return _editCoupleApi.changeCouple(
        memberId: memberId,
        genealogyId: genealogyId,
        ids: ids,
      );
    } catch (e) {
      rethrow;
    }
  }
}
