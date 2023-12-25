import '../../network/dio_provider.dart';

final baseUrl = DioProvider.baseUrl;

class ApiUrlConstants {
  static String register = '$baseUrl/api/register';

  static String login = '$baseUrl/api/login';

  static String genealogy = '$baseUrl/api/genealogy';

  static String treeCreate = '$baseUrl/api/genealogy';

  static String createBranch = '$baseUrl/api/tree/add-node';

  static String editBranch(int genealogyId, int userGenealogyId) {
    return '$baseUrl/api/genealogy/$genealogyId/members/$userGenealogyId';
  }

  static String treeRequest = '$baseUrl/api/tree/request';

  static String getCities = '$baseUrl/api/cities';

  static String getAllMemberRelation(int genealogyId, int memberId) {
    return '$baseUrl/api/genealogy/$genealogyId/members/$memberId/relation';
  }

  static String getTreeView(int id) => '$baseUrl/api/tree/$id';


  static String logout = '$baseUrl/api/logout';

  static String getInfo = '$baseUrl/api/me';

  static String editInfo = '$baseUrl/api/me';


  static String changeMom(int genealogyId) => '$baseUrl/api/genealogy/$genealogyId/members/change-mom';

  static String changeCouple(int genealogyId) => '$baseUrl/api/genealogy/$genealogyId/members/change-couple';

  static String changeRole(int genealogyId, int userGenealogyId) => '$baseUrl/api/genealogy/$genealogyId/members/$userGenealogyId/role';
}
