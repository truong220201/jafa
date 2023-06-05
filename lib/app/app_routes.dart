
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
  static const scanQR = _Paths.scanQR;
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
  static const scanQR = 'scan_qr';
}
