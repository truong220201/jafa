// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../cubit/create_branch_cubit.dart';
// import '../repository/mock_create_branch_repository.dart';

// class CreateBranchView extends StatefulWidget {
//   const CreateBranchView({super.key});

//   @override
//   State<CreateBranchView> createState() => _CreateBranchViewState();
// }

// class _CreateBranchViewState extends State<CreateBranchView> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         return CreateBranchCubit(context.read<MockCreateBranchRepository>());
//         // ..initData(widget.registrationState);
//       },
//       child: _buildPage(context),
//     );
//   }

//   Widget _buildPage(BuildContext context) {
//     return Scaffold();
//   }
// }
