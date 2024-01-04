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
    HomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
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
    TreeCreateViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TreeCreateView(),
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
          user: args.user,
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
          HomeViewRoute.name,
          path: 'home',
        ),
        RouteConfig(
          TreeDetailViewRoute.name,
          path: 'tree_detail',
        ),
        RouteConfig(
          TreeCreateViewRoute.name,
          path: 'create_tree',
        ),
        RouteConfig(
          TreeViewRoute.name,
          path: 'tree_view',
        ),
        RouteConfig(
          EditBranchViewRoute.name,
          path: 'edit_branch',
        ),
        RouteConfig(
          EditBranchNoInfoViewRoute.name,
          path: '/edit-branch-no-info-view',
        ),
        RouteConfig(
          SelectMemberToBranchViewRoute.name,
          path: 'select_member_to_branch',
        ),
        RouteConfig(
          CreateBranchViewRoute.name,
          path: 'create_branch',
        ),
      ];
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
/// [TreeDetailView]
class TreeDetailViewRoute extends PageRouteInfo<TreeDetailViewRouteArgs> {
  TreeDetailViewRoute({
    Key? key,
    required String idJafa,
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

  final String idJafa;

  @override
  String toString() {
    return 'TreeDetailViewRouteArgs{key: $key, idJafa: $idJafa}';
  }
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
/// [TreeView]
class TreeViewRoute extends PageRouteInfo<TreeViewRouteArgs> {
  TreeViewRoute({
    Key? key,
    required String idTree,
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

  final String idTree;

  final int roleId;

  final String nameJafa;

  @override
  String toString() {
    return 'TreeViewRouteArgs{key: $key, idTree: $idTree, roleId: $roleId, nameJafa: $nameJafa}';
  }
}

/// generated route for
/// [EditBranchView]
class EditBranchViewRoute extends PageRouteInfo<EditBranchViewRouteArgs> {
  EditBranchViewRoute({
    Key? key,
    required String genealogyId,
    required String userGenealogyId,
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

  final String genealogyId;

  final String userGenealogyId;

  final int roleId;

  @override
  String toString() {
    return 'EditBranchViewRouteArgs{key: $key, genealogyId: $genealogyId, userGenealogyId: $userGenealogyId, roleId: $roleId}';
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
/// [SelectMemberToBranchView]
class SelectMemberToBranchViewRoute
    extends PageRouteInfo<SelectMemberToBranchViewRouteArgs> {
  SelectMemberToBranchViewRoute({
    Key? key,
    required String idJafa,
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

  final String idJafa;

  final int roleId;

  final String nameJafa;

  @override
  String toString() {
    return 'SelectMemberToBranchViewRouteArgs{key: $key, idJafa: $idJafa, roleId: $roleId, nameJafa: $nameJafa}';
  }
}

/// generated route for
/// [CreateBranchView]
class CreateBranchViewRoute extends PageRouteInfo<CreateBranchViewRouteArgs> {
  CreateBranchViewRoute({
    Key? key,
    required bool isRoot,
    required String userGenealogyId,
    required String genealogyId,
    required int roleId,
    String? name,
    String? avatar,
    String? gender,
    required TreeViewModel user,
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
            user: user,
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
    required this.user,
  });

  final Key? key;

  final bool isRoot;

  final String userGenealogyId;

  final String genealogyId;

  final int roleId;

  final String? name;

  final String? avatar;

  final String? gender;

  final TreeViewModel user;

  @override
  String toString() {
    return 'CreateBranchViewRouteArgs{key: $key, isRoot: $isRoot, userGenealogyId: $userGenealogyId, genealogyId: $genealogyId, roleId: $roleId, name: $name, avatar: $avatar, gender: $gender, user: $user}';
  }
}
