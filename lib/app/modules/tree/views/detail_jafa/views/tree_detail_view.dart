import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/values/text_styles.dart';
import '../../../../../core/values/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/openImg/rating_open_image.dart';
import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';
import '../repository/mock_tree_detail_repository.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TreeDetailView extends StatefulWidget {
  const TreeDetailView({super.key});

  @override
  State<TreeDetailView> createState() => _TreeDetailViewState();
}

class _TreeDetailViewState extends State<TreeDetailView> {
  bool haveJaFa = true;
  void openImg(String imageUrl) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RatingOpenImgWidget(imageUrl: imageUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TreeDetailCubit(context.read<MockTreeDetailRepository>())
              ..initData(),
        child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(
              width: 16.25,
              height: 21.57,
              child: IconButton(
                iconSize: 40,
                onPressed: () async {
                  await context.router.pop();
                },
                icon: SvgPicture.asset(
                  "assets/images/scanqr.svg",
                ),
              ),
            ),
            title: const Text(
              "Chi Tiết Gia Tộc",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            actions: [
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return IconButton(
                  iconSize: 40,
                  onPressed: () {
                    context.read<TreeDetailCubit>().changeShowInviteFriends();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/scanqr.svg",
                  ),
                );
              }),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return IconButton(
                  iconSize: 40,
                  onPressed: () {
                    context.read<TreeDetailCubit>().changeModal();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/scanqr.svg",
                  ),
                );
              })
            ],
            backgroundColor: AppColors.color_148_0_0_1,
          ),
          backgroundColor: const Color.fromRGBO(251, 239, 239, 1),
          body: Stack(
            children: <Widget>[
              haveJaFa
                  ? SingleChildScrollView(child:
                      BlocBuilder<TreeDetailCubit, TreeDetailState>(
                          builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 16.0),
                        child: Column(children: [
                          _familyInfo(context),
                          const SizedBox(
                            height: 10,
                          ),
                          _member(context),
                          const SizedBox(
                            height: 10,
                          ),
                          _domicile(context),
                          const SizedBox(
                            height: 10,
                          ),
                          _relationship(context)
                          //_listCard(context)
                        ]),
                      );
                    }))
                  : _ifNone(context),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return state.showModal
                    ? Positioned(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: _modalMenu(context)),
                      )
                    : Container();
              }),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return state.showInviteFriends
                    ? Positioned(
                        child: Align(
                            alignment: Alignment.center,
                            child: _modalInviteFriends(context)),
                      )
                    : Container();
              })
            ],
          ),
        ));
  }

  Widget _ifNone(BuildContext context) {
    return Column(
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
    );
  }

  Widget _modalMenu(BuildContext context) {
    return BlocBuilder<TreeDetailCubit, TreeDetailState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () => context.read<TreeDetailCubit>().changeModal(),
        child: Container(
          alignment: Alignment.topRight,
          decoration:
              const BoxDecoration(color: Color.fromARGB(141, 133, 133, 133)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: 210,
                height: 137,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _cardMini(context, const Icon(Icons.abc), 'Sửa thông tin',
                        () => {debugPrint('tap')}),
                    _cardMiniExit(context, 'Rời gia tộc', () => {}),
                    _cardMini(context, const Icon(Icons.abc), 'Xoá gia tộc',
                        () => {}),
                  ],
                )),
          ),
        ),
      );
    });
  }

  Widget _modalInviteFriends(BuildContext context) {
    return BlocBuilder<TreeDetailCubit, TreeDetailState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () => context.read<TreeDetailCubit>().changeShowInviteFriends(),
        child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(141, 133, 133, 133)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {},
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 343,
                    height: 462,
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Mời bạn bè vào gia tộc',
                            style: TextStyles.medium16_lineHeight24_sur,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Hiển thị hoặc gửi mã QR này cho bạn bè để thêm họ vào gia tộc Trần Viết Gia',
                            style: TextStyles.small12_lineHeight18_sur,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 222,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 209, 209, 209),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: QrImageView(
                                data: '1234567890',
                                version: QrVersions.auto,
                                size: 100,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconButton(
                                  icon:
                                      Icon(Icons.abc, color: Colors.redAccent),
                                  name: 'Sao chép link'),
                              CustomIconButton(
                                  icon:
                                      Icon(Icons.abc, color: Colors.redAccent),
                                  name: 'Chia sẻ'),
                              CustomIconButton(
                                  icon:
                                      Icon(Icons.abc, color: Colors.redAccent),
                                  name: 'Tải xuống'),
                              CustomIconButton(
                                  icon:
                                      Icon(Icons.abc, color: Colors.redAccent),
                                  name: 'Làm mới'),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const CustomCloseButton()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
      );
    });
  }

  Widget _member(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Thành viên'),
            _card(
                context,
                const Icon(
                  Icons.add,
                  size: 40,
                ),
                'Xem gia phả dạng danh sách',
                '50 thành viên',
                () => {}),
            _card(
                context,
                const Icon(
                  Icons.add,
                  size: 40,
                ),
                'Xem gia phả dạng danh sách',
                '50 thành viên',
                () => {})
          ],
        ));
  }

  Widget _domicile(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nguyên quán'),
            _card(
                context,
                const Icon(
                  Icons.add,
                  size: 40,
                ),
                'Xem gia phả dạng danh sách',
                'Note note',
                () => {}),
          ],
        ));
  }

  Widget _relationship(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quan hệ của bạn với gia tộc này'),
            _card(
                context,
                const Icon(
                  Icons.add,
                  size: 40,
                ),
                'Họ ngoại bên mẹ',
                '',
                () => {}),
          ],
        ));
  }

  Widget _card(BuildContext context, Icon icon, String title, String content,
      Function onTap) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        icon,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != ''
                  ? Text(
                      title,
                      style: TextStyles.medium16_lineHeight24_sur,
                    )
                  : Container(),
              Text(
                content,
                style: TextStyles.small12_lineHeight18_sur,
              )
            ],
          ),
        ),
        const Icon(
          Icons.add,
          size: 40,
        ),
      ]),
    );
  }

  Widget _cardMini(
      BuildContext context, Icon icon, String content, Function onTapp) {
    return GestureDetector(
      onTap: () => onTapp(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: icon,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: TextStyles.medium14_lineHeight21_sur,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _cardMiniExit(BuildContext context, String content, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.abc,
                color: Color.fromARGB(255, 235, 66, 66),
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: TextStyles.medium14_lineHeight21_sur,
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.abc,
                color: Color.fromARGB(255, 235, 66, 66),
              )),
        ]),
      ),
    );
  }

  Widget _familyInfo(BuildContext context) {
    return BlocBuilder<TreeDetailCubit, TreeDetailState>(
        builder: (context, state) {
      return Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          child: InkWell(
            onTap: () {
              openImg(state.treeDetail.imageUrl);
            },
            child: Image.network(
              state.treeDetail.imageUrl != ''
                  ? state.treeDetail.imageUrl
                  : 'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.treeDetail.user.name,
                          style: TextStyles.medium16_lineHeight24_sur,
                        ),
                        Text(
                          state.treeDetail.familyInfo,
                          style: TextStyles.medium14_lineHeight21_sur,
                        )
                      ]),
                  const CustomButton(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.treeDetail.familyInfoContent,
                  style: TextStyles.small12_lineHeight18_sur,
                ),
              )
            ]))
      ]);
    });
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 178, 0, 0),
              borderRadius: BorderRadius.all(Radius.circular(33.5))),
          child: const Text(
            'Xem Cây',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
          height: 44,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: const Text(
            'Đóng',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.name,
  });
  final Icon icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
          onTap: () => {},
          child: Column(children: [
            icon,
            Text(
              name,
              style: TextStyles.small12_lineHeight18_black_sur,
            )
          ])),
    );
  }
}
