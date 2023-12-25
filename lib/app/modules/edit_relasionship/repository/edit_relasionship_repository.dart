import '../../../data/model/all_relasion_response.dart';
import '../api/edit_relasionship_api.dart';

class EditRelationShipRepository {
  final EditRelationShipApi _editRelationShipApi;
  EditRelationShipRepository(this._editRelationShipApi);

  Future<AllRelationResponse> getAllRelasionship({
    required int genealogyId,
    required int memberId,
  }) {
    try {
      return _editRelationShipApi.getAllRelasionship(
          genealogyId: genealogyId, memberId: memberId);
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> createBranch({
    required String createType,
    required int userGenealogyId,
    required int genealogyId,
  }) {
    return _editRelationShipApi.createBranch(
        createType: createType,
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId);
  }
}
