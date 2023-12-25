// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'main_router.dart';

class _$MainRouter extends RootStackRouter {
  _$MainRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ConfirmViewRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ConfirmView(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    RegisterInfoViewRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterInfoViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RegisterInfoView(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    RegisterPhoneViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPhoneView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    TreeCreateViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TreeCreateView(),
      );
    },
    TreeDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<TreeDetailViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TreeDetailView(
          key: args.key,
          idJafa: args.idJafa,
        ),
      );
    },
    TreeEditViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TreeEditView(),
      );
    },
    ScanQRViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ScanQRView(),
      );
    },
    TreeViewRoute.name: (routeData) {
      final args = routeData.argsAs<TreeViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TreeView(
          key: args.key,
          idTree: args.idTree,
          roleId: args.roleId,
          nameJafa: args.nameJafa,
        ),
      );
    },
    MemberListViewRoute.name: (routeData) {
      final args = routeData.argsAs<MemberListViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MemberListView(
          key: args.key,
          idJafa: args.idJafa,
        ),
      );
    },
    MemberInfoViewRoute.name: (routeData) {
      final args = routeData.argsAs<MemberInfoViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MemberInfoView(
          key: args.key,
          idJafa: args.idJafa,
          idMember: args.idMember,
          roleId: args.roleId,
        ),
      );
    },
    EditBranchViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditBranchViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditBranchView(
          key: args.key,
          genealogyId: args.genealogyId,
          userGenealogyId: args.userGenealogyId,
          roleId: args.roleId,
        ),
      );
    },
    CreateBranchViewRoute.name: (routeData) {
      final args = routeData.argsAs<CreateBranchViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CreateBranchView(
          key: args.key,
          isRoot: args.isRoot,
          userGenealogyId: args.userGenealogyId,
          genealogyId: args.genealogyId,
          roleId: args.roleId,
          name: args.name,
          avatar: args.avatar,
          gender: args.gender,
        ),
      );
    },
    EditRelationShipViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditRelationShipViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditRelationShipView(
          key: args.key,
          genealogyId: args.genealogyId,
          memberId: args.memberId,
        ),
      );
    },
    EditBranchNoInfoViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditBranchNoInfoViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditBranchNoInfoView(
          key: args.key,
          genealogyId: args.genealogyId,
          memberId: args.memberId,
          memberRootId: args.memberRootId,
        ),
      );
    },
    UserInfoViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserInfoView(),
      );
    },
    EditMomViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditMomViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditMomView(
          key: args.key,
          wifesOfDad: args.wifesOfDad,
          genealogyId: args.genealogyId,
        ),
      );
    },
    EditCoupleViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditCoupleViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditCoupleView(
          key: args.key,
          couple: args.couple,
          genealogyId: args.genealogyId,
          userGenealogyId: args.userGenealogyId,
        ),
      );
    },
    EditMemberRoleViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditMemberRoleViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditMemberRoleView(
          key: args.key,
          userId: args.userId,
          roleId: args.roleId,
          genealogyId: args.genealogyId,
        ),
      );
    },
    UserDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: UserDetailView(
          key: args.key,
          user: args.user,
        ),
      );
    },
    EditUserInfoViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditUserInfoViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditUserInfoView(
          key: args.key,
          user: args.user,
        ),
      );
    },
    WelcomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeView(),
      );
    },
    SelectMemberToBranchViewRoute.name: (routeData) {
      final args = routeData.argsAs<SelectMemberToBranchViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SelectMemberToBranchView(
          key: args.key,
          idJafa: args.idJafa,
          roleId: args.roleId,
          nameJafa: args.nameJafa,
        ),
      );
    },
    TreeByListViewRoute.name: (routeData) {
      final args = routeData.argsAs<TreeByListViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TreeByListView(
          key: args.key,
          idJafa: args.idJafa,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'home',
          fullMatch: true,
        ),
        RouteConfig(
          ConfirmViewRoute.name,
          path: 'confirm',
        ),
        RouteConfig(
          RegisterInfoViewRoute.name,
          path: 'register',
        ),
        RouteConfig(
          RegisterPhoneViewRoute.name,
          path: 'phone',
        ),
        RouteConfig(
          HomeViewRoute.name,
          path: 'home',
        ),
        RouteConfig(
          TreeCreateViewRoute.name,
          path: 'create_tree',
        ),
        RouteConfig(
          TreeDetailViewRoute.name,
          path: 'tree_detail',
        ),
        RouteConfig(
          TreeEditViewRoute.name,
          path: 'tree_detail',
        ),
        RouteConfig(
          ScanQRViewRoute.name,
          path: 'scan_qr',
        ),
        RouteConfig(
          TreeViewRoute.name,
          path: 'tree_view',
        ),
        RouteConfig(
          MemberListViewRoute.name,
          path: 'member_list',
        ),
        RouteConfig(
          MemberInfoViewRoute.name,
          path: 'member_info',
        ),
        RouteConfig(
          EditBranchViewRoute.name,
          path: 'edit_branch',
        ),
        RouteConfig(
          CreateBranchViewRoute.name,
          path: 'create_branch',
        ),
        RouteConfig(
          EditRelationShipViewRoute.name,
          path: '/edit-relation-ship-view',
        ),
        RouteConfig(
          EditBranchNoInfoViewRoute.name,
          path: '/edit-branch-no-info-view',
        ),
        RouteConfig(
          UserInfoViewRoute.name,
          path: '/user-info-view',
        ),
        RouteConfig(
          EditMomViewRoute.name,
          path: '/edit-mom-view',
        ),
        RouteConfig(
          EditCoupleViewRoute.name,
          path: '/edit-couple-view',
        ),
        RouteConfig(
          EditMemberRoleViewRoute.name,
          path: '/edit-member-role-view',
        ),
        RouteConfig(
          UserDetailViewRoute.name,
          path: '/user-detail-view',
        ),
        RouteConfig(
          EditUserInfoViewRoute.name,
          path: '/edit-user-info-view',
        ),
        RouteConfig(
          WelcomeViewRoute.name,
          path: 'welcome',
        ),
        RouteConfig(
          SelectMemberToBranchViewRoute.name,
          path: 'select_member_to_branch',
        ),
        RouteConfig(
          TreeByListViewRoute.name,
          path: 'tree_by_list',
        ),
      ];
}

/// generated route for
/// [ConfirmView]
class ConfirmViewRoute extends PageRouteInfo<ConfirmViewRouteArgs> {
  ConfirmViewRoute({
    Key? key,
    required RegistrationCubit cubit,
  }) : super(
          ConfirmViewRoute.name,
          path: 'confirm',
          args: ConfirmViewRouteArgs(
            key: key,
            cubit: cubit,
          ),
        );

  static const String name = 'ConfirmViewRoute';
}

class ConfirmViewRouteArgs {
  const ConfirmViewRouteArgs({
    this.key,
    required this.cubit,
  });

  final Key? key;

  final RegistrationCubit cubit;

  @override
  String toString() {
    return 'ConfirmViewRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [RegisterInfoView]
class RegisterInfoViewRoute extends PageRouteInfo<RegisterInfoViewRouteArgs> {
  RegisterInfoViewRoute({
    Key? key,
    required RegistrationCubit cubit,
  }) : super(
          RegisterInfoViewRoute.name,
          path: 'register',
          args: RegisterInfoViewRouteArgs(
            key: key,
            cubit: cubit,
          ),
        );

  static const String name = 'RegisterInfoViewRoute';
}

class RegisterInfoViewRouteArgs {
  const RegisterInfoViewRouteArgs({
    this.key,
    required this.cubit,
  });

  final Key? key;

  final RegistrationCubit cubit;

  @override
  String toString() {
    return 'RegisterInfoViewRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [RegisterPhoneView]
class RegisterPhoneViewRoute extends PageRouteInfo<void> {
  const RegisterPhoneViewRoute()
      : super(
          RegisterPhoneViewRoute.name,
          path: 'phone',
        );

  static const String name = 'RegisterPhoneViewRoute';
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [TreeCreateView]
class TreeCreateViewRoute extends PageRouteInfo<void> {
  const TreeCreateViewRoute()
      : super(
          TreeCreateViewRoute.name,
          path: 'create_tree',
        );

  static const String name = 'TreeCreateViewRoute';
}

/// generated route for
/// [TreeDetailView]
class TreeDetailViewRoute extends PageRouteInfo<TreeDetailViewRouteArgs> {
  TreeDetailViewRoute({
    Key? key,
    required int idJafa,
  }) : super(
          TreeDetailViewRoute.name,
          path: 'tree_detail',
          args: TreeDetailViewRouteArgs(
            key: key,
            idJafa: idJafa,
          ),
        );

  static const String name = 'TreeDetailViewRoute';
}

class TreeDetailViewRouteArgs {
  const TreeDetailViewRouteArgs({
    this.key,
    required this.idJafa,
  });

  final Key? key;

  final int idJafa;

  @override
  String toString() {
    return 'TreeDetailViewRouteArgs{key: $key, idJafa: $idJafa}';
  }
}

/// generated route for
/// [TreeEditView]
class TreeEditViewRoute extends PageRouteInfo<void> {
  const TreeEditViewRoute()
      : super(
          TreeEditViewRoute.name,
          path: 'tree_detail',
        );

  static const String name = 'TreeEditViewRoute';
}

/// generated route for
/// [ScanQRView]
class ScanQRViewRoute extends PageRouteInfo<void> {
  const ScanQRViewRoute()
      : super(
          ScanQRViewRoute.name,
          path: 'scan_qr',
        );

  static const String name = 'ScanQRViewRoute';
}

/// generated route for
/// [TreeView]
class TreeViewRoute extends PageRouteInfo<TreeViewRouteArgs> {
  TreeViewRoute({
    Key? key,
    required int idTree,
    required int roleId,
    required String nameJafa,
  }) : super(
          TreeViewRoute.name,
          path: 'tree_view',
          args: TreeViewRouteArgs(
            key: key,
            idTree: idTree,
            roleId: roleId,
            nameJafa: nameJafa,
          ),
        );

  static const String name = 'TreeViewRoute';
}

class TreeViewRouteArgs {
  const TreeViewRouteArgs({
    this.key,
    required this.idTree,
    required this.roleId,
    required this.nameJafa,
  });

  final Key? key;

  final int idTree;

  final int roleId;

  final String nameJafa;

  @override
  String toString() {
    return 'TreeViewRouteArgs{key: $key, idTree: $idTree, roleId: $roleId, nameJafa: $nameJafa}';
  }
}

/// generated route for
/// [MemberListView]
class MemberListViewRoute extends PageRouteInfo<MemberListViewRouteArgs> {
  MemberListViewRoute({
    Key? key,
    required int idJafa,
  }) : super(
          MemberListViewRoute.name,
          path: 'member_list',
          args: MemberListViewRouteArgs(
            key: key,
            idJafa: idJafa,
          ),
        );

  static const String name = 'MemberListViewRoute';
}

class MemberListViewRouteArgs {
  const MemberListViewRouteArgs({
    this.key,
    required this.idJafa,
  });

  final Key? key;

  final int idJafa;

  @override
  String toString() {
    return 'MemberListViewRouteArgs{key: $key, idJafa: $idJafa}';
  }
}

/// generated route for
/// [MemberInfoView]
class MemberInfoViewRoute extends PageRouteInfo<MemberInfoViewRouteArgs> {
  MemberInfoViewRoute({
    Key? key,
    required int idJafa,
    required int idMember,
    required int roleId,
  }) : super(
          MemberInfoViewRoute.name,
          path: 'member_info',
          args: MemberInfoViewRouteArgs(
            key: key,
            idJafa: idJafa,
            idMember: idMember,
            roleId: roleId,
          ),
        );

  static const String name = 'MemberInfoViewRoute';
}

class MemberInfoViewRouteArgs {
  const MemberInfoViewRouteArgs({
    this.key,
    required this.idJafa,
    required this.idMember,
    required this.roleId,
  });

  final Key? key;

  final int idJafa;

  final int idMember;

  final int roleId;

  @override
  String toString() {
    return 'MemberInfoViewRouteArgs{key: $key, idJafa: $idJafa, idMember: $idMember, roleId: $roleId}';
  }
}

/// generated route for
/// [EditBranchView]
class EditBranchViewRoute extends PageRouteInfo<EditBranchViewRouteArgs> {
  EditBranchViewRoute({
    Key? key,
    required int genealogyId,
    required int userGenealogyId,
    required int roleId,
  }) : super(
          EditBranchViewRoute.name,
          path: 'edit_branch',
          args: EditBranchViewRouteArgs(
            key: key,
            genealogyId: genealogyId,
            userGenealogyId: userGenealogyId,
            roleId: roleId,
          ),
        );

  static const String name = 'EditBranchViewRoute';
}

class EditBranchViewRouteArgs {
  const EditBranchViewRouteArgs({
    this.key,
    required this.genealogyId,
    required this.userGenealogyId,
    required this.roleId,
  });

  final Key? key;

  final int genealogyId;

  final int userGenealogyId;

  final int roleId;

  @override
  String toString() {
    return 'EditBranchViewRouteArgs{key: $key, genealogyId: $genealogyId, userGenealogyId: $userGenealogyId, roleId: $roleId}';
  }
}

/// generated route for
/// [CreateBranchView]
class CreateBranchViewRoute extends PageRouteInfo<CreateBranchViewRouteArgs> {
  CreateBranchViewRoute({
    Key? key,
    required bool isRoot,
    required int userGenealogyId,
    required int genealogyId,
    required int roleId,
    String? name,
    String? avatar,
    String? gender,
  }) : super(
          CreateBranchViewRoute.name,
          path: 'create_branch',
          args: CreateBranchViewRouteArgs(
            key: key,
            isRoot: isRoot,
            userGenealogyId: userGenealogyId,
            genealogyId: genealogyId,
            roleId: roleId,
            name: name,
            avatar: avatar,
            gender: gender,
          ),
        );

  static const String name = 'CreateBranchViewRoute';
}

class CreateBranchViewRouteArgs {
  const CreateBranchViewRouteArgs({
    this.key,
    required this.isRoot,
    required this.userGenealogyId,
    required this.genealogyId,
    required this.roleId,
    this.name,
    this.avatar,
    this.gender,
  });

  final Key? key;

  final bool isRoot;

  final int userGenealogyId;

  final int genealogyId;

  final int roleId;

  final String? name;

  final String? avatar;

  final String? gender;

  @override
  String toString() {
    return 'CreateBranchViewRouteArgs{key: $key, isRoot: $isRoot, userGenealogyId: $userGenealogyId, genealogyId: $genealogyId, roleId: $roleId, name: $name, avatar: $avatar, gender: $gender}';
  }
}

/// generated route for
/// [EditRelationShipView]
class EditRelationShipViewRoute
    extends PageRouteInfo<EditRelationShipViewRouteArgs> {
  EditRelationShipViewRoute({
    Key? key,
    required int genealogyId,
    required int memberId,
  }) : super(
          EditRelationShipViewRoute.name,
          path: '/edit-relation-ship-view',
          args: EditRelationShipViewRouteArgs(
            key: key,
            genealogyId: genealogyId,
            memberId: memberId,
          ),
        );

  static const String name = 'EditRelationShipViewRoute';
}

class EditRelationShipViewRouteArgs {
  const EditRelationShipViewRouteArgs({
    this.key,
    required this.genealogyId,
    required this.memberId,
  });

  final Key? key;

  final int genealogyId;

  final int memberId;

  @override
  String toString() {
    return 'EditRelationShipViewRouteArgs{key: $key, genealogyId: $genealogyId, memberId: $memberId}';
  }
}

/// generated route for
/// [EditBranchNoInfoView]
class EditBranchNoInfoViewRoute
    extends PageRouteInfo<EditBranchNoInfoViewRouteArgs> {
  EditBranchNoInfoViewRoute({
    Key? key,
    required int genealogyId,
    required int memberId,
    required int memberRootId,
  }) : super(
          EditBranchNoInfoViewRoute.name,
          path: '/edit-branch-no-info-view',
          args: EditBranchNoInfoViewRouteArgs(
            key: key,
            genealogyId: genealogyId,
            memberId: memberId,
            memberRootId: memberRootId,
          ),
        );

  static const String name = 'EditBranchNoInfoViewRoute';
}

class EditBranchNoInfoViewRouteArgs {
  const EditBranchNoInfoViewRouteArgs({
    this.key,
    required this.genealogyId,
    required this.memberId,
    required this.memberRootId,
  });

  final Key? key;

  final int genealogyId;

  final int memberId;

  final int memberRootId;

  @override
  String toString() {
    return 'EditBranchNoInfoViewRouteArgs{key: $key, genealogyId: $genealogyId, memberId: $memberId, memberRootId: $memberRootId}';
  }
}

/// generated route for
/// [UserInfoView]
class UserInfoViewRoute extends PageRouteInfo<void> {
  const UserInfoViewRoute()
      : super(
          UserInfoViewRoute.name,
          path: '/user-info-view',
        );

  static const String name = 'UserInfoViewRoute';
}

/// generated route for
/// [EditMomView]
class EditMomViewRoute extends PageRouteInfo<EditMomViewRouteArgs> {
  EditMomViewRoute({
    Key? key,
    List<User>? wifesOfDad,
    required int genealogyId,
  }) : super(
          EditMomViewRoute.name,
          path: '/edit-mom-view',
          args: EditMomViewRouteArgs(
            key: key,
            wifesOfDad: wifesOfDad,
            genealogyId: genealogyId,
          ),
        );

  static const String name = 'EditMomViewRoute';
}

class EditMomViewRouteArgs {
  const EditMomViewRouteArgs({
    this.key,
    this.wifesOfDad,
    required this.genealogyId,
  });

  final Key? key;

  final List<User>? wifesOfDad;

  final int genealogyId;

  @override
  String toString() {
    return 'EditMomViewRouteArgs{key: $key, wifesOfDad: $wifesOfDad, genealogyId: $genealogyId}';
  }
}

/// generated route for
/// [EditCoupleView]
class EditCoupleViewRoute extends PageRouteInfo<EditCoupleViewRouteArgs> {
  EditCoupleViewRoute({
    Key? key,
    List<User>? couple,
    required int genealogyId,
    required int userGenealogyId,
  }) : super(
          EditCoupleViewRoute.name,
          path: '/edit-couple-view',
          args: EditCoupleViewRouteArgs(
            key: key,
            couple: couple,
            genealogyId: genealogyId,
            userGenealogyId: userGenealogyId,
          ),
        );

  static const String name = 'EditCoupleViewRoute';
}

class EditCoupleViewRouteArgs {
  const EditCoupleViewRouteArgs({
    this.key,
    this.couple,
    required this.genealogyId,
    required this.userGenealogyId,
  });

  final Key? key;

  final List<User>? couple;

  final int genealogyId;

  final int userGenealogyId;

  @override
  String toString() {
    return 'EditCoupleViewRouteArgs{key: $key, couple: $couple, genealogyId: $genealogyId, userGenealogyId: $userGenealogyId}';
  }
}

/// generated route for
/// [EditMemberRoleView]
class EditMemberRoleViewRoute
    extends PageRouteInfo<EditMemberRoleViewRouteArgs> {
  EditMemberRoleViewRoute({
    Key? key,
    required int userId,
    required int roleId,
    required int genealogyId,
  }) : super(
          EditMemberRoleViewRoute.name,
          path: '/edit-member-role-view',
          args: EditMemberRoleViewRouteArgs(
            key: key,
            userId: userId,
            roleId: roleId,
            genealogyId: genealogyId,
          ),
        );

  static const String name = 'EditMemberRoleViewRoute';
}

class EditMemberRoleViewRouteArgs {
  const EditMemberRoleViewRouteArgs({
    this.key,
    required this.userId,
    required this.roleId,
    required this.genealogyId,
  });

  final Key? key;

  final int userId;

  final int roleId;

  final int genealogyId;

  @override
  String toString() {
    return 'EditMemberRoleViewRouteArgs{key: $key, userId: $userId, roleId: $roleId, genealogyId: $genealogyId}';
  }
}

/// generated route for
/// [UserDetailView]
class UserDetailViewRoute extends PageRouteInfo<UserDetailViewRouteArgs> {
  UserDetailViewRoute({
    Key? key,
    required User user,
  }) : super(
          UserDetailViewRoute.name,
          path: '/user-detail-view',
          args: UserDetailViewRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'UserDetailViewRoute';
}

class UserDetailViewRouteArgs {
  const UserDetailViewRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final User user;

  @override
  String toString() {
    return 'UserDetailViewRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [EditUserInfoView]
class EditUserInfoViewRoute extends PageRouteInfo<EditUserInfoViewRouteArgs> {
  EditUserInfoViewRoute({
    Key? key,
    required User user,
  }) : super(
          EditUserInfoViewRoute.name,
          path: '/edit-user-info-view',
          args: EditUserInfoViewRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'EditUserInfoViewRoute';
}

class EditUserInfoViewRouteArgs {
  const EditUserInfoViewRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final User user;

  @override
  String toString() {
    return 'EditUserInfoViewRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [WelcomeView]
class WelcomeViewRoute extends PageRouteInfo<void> {
  const WelcomeViewRoute()
      : super(
          WelcomeViewRoute.name,
          path: 'welcome',
        );

  static const String name = 'WelcomeViewRoute';
}

/// generated route for
/// [SelectMemberToBranchView]
class SelectMemberToBranchViewRoute
    extends PageRouteInfo<SelectMemberToBranchViewRouteArgs> {
  SelectMemberToBranchViewRoute({
    Key? key,
    required int idJafa,
    required int roleId,
    required String nameJafa,
  }) : super(
          SelectMemberToBranchViewRoute.name,
          path: 'select_member_to_branch',
          args: SelectMemberToBranchViewRouteArgs(
            key: key,
            idJafa: idJafa,
            roleId: roleId,
            nameJafa: nameJafa,
          ),
        );

  static const String name = 'SelectMemberToBranchViewRoute';
}

class SelectMemberToBranchViewRouteArgs {
  const SelectMemberToBranchViewRouteArgs({
    this.key,
    required this.idJafa,
    required this.roleId,
    required this.nameJafa,
  });

  final Key? key;

  final int idJafa;

  final int roleId;

  final String nameJafa;

  @override
  String toString() {
    return 'SelectMemberToBranchViewRouteArgs{key: $key, idJafa: $idJafa, roleId: $roleId, nameJafa: $nameJafa}';
  }
}

/// generated route for
/// [TreeByListView]
class TreeByListViewRoute extends PageRouteInfo<TreeByListViewRouteArgs> {
  TreeByListViewRoute({
    Key? key,
    required int idJafa,
  }) : super(
          TreeByListViewRoute.name,
          path: 'tree_by_list',
          args: TreeByListViewRouteArgs(
            key: key,
            idJafa: idJafa,
          ),
        );

  static const String name = 'TreeByListViewRoute';
}

class TreeByListViewRouteArgs {
  const TreeByListViewRouteArgs({
    this.key,
    required this.idJafa,
  });

  final Key? key;

  final int idJafa;

  @override
  String toString() {
    return 'TreeByListViewRouteArgs{key: $key, idJafa: $idJafa}';
  }
}
