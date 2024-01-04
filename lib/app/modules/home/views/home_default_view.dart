import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/core/values/string_constants.dart';
import 'package:flutter_firebase/app/core/widgets/bottom/bottom_tab.dart';
import 'package:flutter_firebase/app/core/widgets/card/custom_card.dart';
import 'package:flutter_firebase/app/core/widgets/search/custom_search.dart';
import 'package:flutter_firebase/app/main_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/values/app_colors.dart';
import '../../../data/model/jafa_model.dart';
import '../../scan_QR/scan_qr_view.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../repository/home_repository.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool haveJaFa = true;
  void openScan() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ScanQRView()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: SizedBox(
          width: 16,
          height: 21,
          child: SvgPicture.asset(
            "assets/images/tree.svg",
          ),
        ),
        title: Text(
          StringConstants.jafaList,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        actions: const [
          // IconButton(
          //   iconSize: 40,
          //   onPressed: () async {
          //     await context.router.push(const ScanQRViewRoute());
          //   },
          //   icon: SvgPicture.asset(
          //     "assets/images/scanqr.svg",
          //   ),
          // )
        ],
        backgroundColor: AppColors.colorFF940000,
      ),
      bottomNavigationBar: const BottomTab(),
      backgroundColor: const Color.fromRGBO(251, 239, 239, 1),
      body: BlocProvider(
          create: (context) =>
              HomeCubit(context.read<HomeRepository>())..initData(),
          child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            return state.userList.isNotEmpty
                ? Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(19),
                      child: SearchWidget(),
                    ),
                    !state.isLoading
                        ? Expanded(
                            child: _listCard(context, state.userList),
                          )
                        : const Center(child: CircularProgressIndicator())
                  ])
                : _ifEmpty();
          })),
      floatingActionButton: SizedBox(
        width: 68,
        height: 68,
        child: FloatingActionButton(
          onPressed: () async {
            await context.router.push(const TreeCreateViewRoute());
            // ignore: use_build_context_synchronously
            // await context.read<HomeCubit>().loadDataJaFa();
          },
          backgroundColor: AppColors.colorFFB20000,
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          mini: false,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _ifEmpty() {
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        Center(
          child: Text(
            StringConstants.jafaInHere,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            StringConstants.youCanMemorize,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, color: Color.fromRGBO(173, 173, 173, 1)),
          ),
        ),
        const SizedBox(
          height: 68,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(StringConstants.createNow,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.colorFFB20000,
                    ))),
            Text(StringConstants.lowKeyOr),
            TextButton(
                onPressed: () {},
                child: Text(StringConstants.joinJafa,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.colorFFB20000,
                    ))),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        GestureDetector(
          child: const SizedBox(
            child: Text('Làm mới ngay!'),
          ),
          onTap: () => context.read<HomeCubit>().loadDataJaFa(),
        )
      ],
    );
  }

  Widget _listCard(BuildContext context, List<JafaModel> listUser) {
    List<JafaModel> listCardSelect = listUser;
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () async {
          debugPrint('reset');
          context.read<HomeCubit>().loadDataJaFa();
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: SizedBox(
          height: 700,
          child: ListView.builder(
            itemCount: listCardSelect.length,
            itemBuilder: (BuildContext context, int index) {
              final JafaModel i = listCardSelect[index];
              return ListTile(
                  title: GestureDetector(
                onTap: () async {
                  //context.read<HomeCubit>().getConservations();
                  await context.router
                      .push(TreeDetailViewRoute(idJafa: i.id ?? ''));
                  // ignore: use_build_context_synchronously
                  context.read<HomeCubit>().loadData();
                },
                child: CustomCard(
                  name: i.name,
                  content: i.relationName,
                  image: i.imageJafa,
                  //image: null,
                ),
              ));
            },
          ),
        ),
      );
    });
  }
}
