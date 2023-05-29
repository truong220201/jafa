import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/main_router.dart';
import 'package:genealogy_management/app/modules/tree/views/home/repository/home_repository.dart';
import 'package:genealogy_management/app/modules/tree/views/home/repository/mock_home_repository.dart';
import '../../../../../core/values/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/bottom/bottomTab.dart';
import '../../../../../core/widgets/card/custom_card.dart';
import '../../../../../core/widgets/search/custom_search.dart';
import '../../../../../data/model/user_model.dart';
import '../../scan_QR/scan_qr_view.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: 16.25,
          height: 21.57,
          child: SvgPicture.asset(
            "assets/images/tree.svg",
          ),
        ),
        title: const Text(
          "Danh sách gia tộc",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        actions: [
          IconButton(
            iconSize: 40,
            onPressed: () async {
              await context.router.push(const ScanQRViewRoute());
            },
            icon: SvgPicture.asset(
              "assets/images/scanqr.svg",
            ),
          )
        ],
        backgroundColor: AppColors.color_148_0_0_1,
      ),
      bottomNavigationBar: const BottomTab(),
      backgroundColor: const Color.fromRGBO(251, 239, 239, 1),
      body: BlocProvider(
          create: (context) =>
              HomeCubit(context.read<MockHomeRepository>())..initData(),
          child: Stack(
            children: [
              haveJaFa
                  ? MultiBlocListener(
                      listeners: [
                        BlocListener<HomeCubit, HomeState>(
                            listener: (BuildContext context, state) {
                          Column(children: [
                            const Padding(
                              padding: EdgeInsets.all(19),
                              child: SearchWidget(),
                            ),
                            _listCard(context, state.userList)
                          ]);
                        }),
                      ],
                      child: Container(),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        const Center(
                          child: Text(
                            "Các gia tộc của bạn sẽ xuất hiện ở đây",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Center(
                          child: Text(
                            "Bạn có thể thêm cây gia phả cho gia tộc,\nghi nhớ ngày giỗ, ngày họp mặt\nvà nhiều hơn thế nữa.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(173, 173, 173, 1)),
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
                                child: const Text("Tạo ngay",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.color_148_0_0_1,
                                    ))),
                            const Text("hoặc"),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Tham gia vào gia phả",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.color_148_0_0_1,
                                    ))),
                          ],
                        )
                      ],
                    ),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                return Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(19),
                    child: SearchWidget(),
                  ),
                  _listCard(context, state.userList)
                ]);
              })
            ],
          )),
      floatingActionButton: SizedBox(
        width: 68,
        height: 68,
        child: FloatingActionButton(
          onPressed: () async {
            await context.router.push(const TreeCreateViewRoute());
          },
          backgroundColor: AppColors.color_178_0_0_1,
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

  Widget _listCard(BuildContext context, List<UserModel> listUser) {
    List<UserModel> listCardSelect = listUser;
    return Column(
        children: listCardSelect
            .map((i) => GestureDetector(
                onTap: () async {
                  await context.router.push(const TreeDetailViewRoute());
                },
                child: CustomCard(name: i.name, content: i.content)))
            .toList());
  }
}
