abstract class Routes {
  const Routes._();

  static const home = _Paths.home;
  static const login = _Paths.login;
  static const confirm = _Paths.confirm;
  static const phone = _Paths.phone;
  static const register = _Paths.register;
  static const createTree = _Paths.createTree;
  static const editBranch = _Paths.editBranch;
  static const treeDetail = _Paths.treeDetail;
  static const treeEdit = _Paths.treeEdit;
  static const scanQR = _Paths.scanQR;
  static const treeView = _Paths.treeView;
  static const memberList = _Paths.memberList;
  static const memberInfo = _Paths.memberInfo;
  static const welcome = _Paths.welcome;
  static const createBranch = _Paths.createBranch;
  static const selectMemberToBranch = _Paths.selectMemberToBranch;
  static const treeByList = _Paths.treeByList;
}

abstract class _Paths {
  static const home = 'home';
  static const login = 'login';
  static const confirm = 'confirm';
  static const phone = 'phone';
  static const register = 'register';
  static const createTree = 'create_tree';
  static const editBranch = 'edit_branch';
  static const treeDetail = 'tree_detail';
  static const treeEdit = 'tree_edit';
  static const memberList = 'member_list';
  static const scanQR = 'scan_qr';
  static const treeView = 'tree_view';
  static const memberInfo = 'member_info';
  static const welcome = 'welcome';
  static const createBranch = 'create_branch';
  static const selectMemberToBranch = 'select_member_to_branch';
  static const treeByList = 'tree_by_list';
}
