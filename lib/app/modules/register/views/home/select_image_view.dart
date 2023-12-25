class ImagePickerView {}
// class ImagePickerView extends StatefulWidget {
//   const ImagePickerView({Key? key, required this.registrationState})
//       : super(key: key);

//   final RegistrationState registrationState;

  // @override
  // State<ImagePickerView> createState() => _ImagePickerViewState();
// }

// class _ImagePickerViewState extends State<ImagePickerView> {
  // List<String>? imageList;

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) {
  //       return RegistrationCubit(context.read<RegistrationRepository>())
  //         ..initImageList(widget.registrationState);
  //     },
  //     child: _buildPage(context),
  //   );
  // }

  // Widget _buildPage(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //         padding:
  //             const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
  //         child: BlocListener<RegistrationCubit, RegistrationState>(
  //             // listenWhen: (previous, current) =>
  //             //     previous.avatar != current.avatar,
  //             listener: (BuildContext context, state) async {
  //           // await context.router
  //           //     .push(RegisterInfoViewRoute(registrationState: state));
  //         }, child: BlocBuilder<RegistrationCubit, RegistrationState>(
  //                 builder: (context, state) {
  //           final cubit = context.read<RegistrationCubit>();
  //           return StaggeredGridView.countBuilder(
  //             staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
  //             crossAxisCount: 6,
  //             mainAxisSpacing: 2,
  //             crossAxisSpacing: 2,
  //             itemCount:
  //                 (state.imageList != null) ? state.imageList!.length + 1 : 2,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Container(
  //                   height: 120,
  //                   decoration: BoxDecoration(
  //                     border: Border.all(),
  //                     borderRadius: BorderRadius.circular(2),
  //                     color: Colors.white,
  //                   ),
  //                   child: (index == 0)
  //                       ? InkWell(
  //                           onTap: () async {
  //                             // Navigator.of(context).pop();
  //                             // await context.router.push(
  //                             //     RegisterInfoViewRoute(
  //                             //         registrationState: state));

  //                             String avatar = await cubit.takeImageFromCamera();
  //                             cubit.setAvatar(avatar);
  //                             // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  //                             cubit.emit(cubit.state
  //                                 .copyWith(avatar: RegisterInfoView.avatar));
  //                             // Navigator.of(context).pop();
  //                             await context.router.push(RegisterInfoViewRoute(
  //                                 registrationState: cubit.state));
  //                           },
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: const [
  //                               Icon(
  //                                 Icons.camera_alt,
  //                                 size: 32,
  //                               ),
  //                               Text(
  //                                 "Chụp ảnh",
  //                                 style: TextStyle(
  //                                   fontSize: 16,
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         )
  //                       : (state.showImageLoading)
  //                           ? InkWell(
  //                               onTap: () async {
  //                                 RegisterInfoView.avatar =
  //                                     state.imageList![index - 1];
  //                                 final avatar = state.imageList![index - 1];
  //                                 cubit.setAvatar(avatar);
  //                                 // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  //                                 cubit.emit(cubit.state.copyWith(
  //                                     avatar: RegisterInfoView.avatar));
  //                                 // Navigator.of(context).pop();
  //                                 await context.router.push(
  //                                     RegisterInfoViewRoute(
  //                                         registrationState: cubit.state));
  //                               },
  //                               child: Image.file(
  //                                 File(state.imageList![index - 1]),
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             )
  //                           : Center(
  //                               child: Container(
  //                                 width: 100,
  //                                 height: 100,
  //                                 child: const CircularProgressIndicator(
  //                                   strokeWidth: 4,
  //                                   valueColor: AlwaysStoppedAnimation<Color>(
  //                                       AppColors.color178_0_0_1),
  //                                   backgroundColor: AppColors.color96_96_96_1,
  //                                 ),
  //                               ),
  //                             ));
  //             },
  //           );
  //         }))),
  //   );
  // }
// }
