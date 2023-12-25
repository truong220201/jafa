import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genealogy_management/app/modules/tree_by_list/cubit/tree_by_list_cubit.dart';
import 'package:genealogy_management/app/modules/tree_by_list/repository/tree_by_list_repository.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

class TreeByListView extends StatefulWidget {
  const TreeByListView({
    super.key,
    required this.idJafa,
  });
  final int idJafa;
  @override
  State<TreeByListView> createState() => _TreeByListViewState();
}

class _TreeByListViewState extends State<TreeByListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TreeByListCubit(context.read<TreeByListRepository>(), widget.idJafa)
              ..initData(),
        child: TreeByListPage(
          idJafa: widget.idJafa,
        ));
  }
}

class TreeByListPage extends StatefulWidget {
  const TreeByListPage({
    super.key,
    required this.idJafa,
  });
  final int idJafa;
  @override
  State<TreeByListPage> createState() => _TreeByListPageState();
}

class _TreeByListPageState extends State<TreeByListPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(
            width: 16,
            height: 21,
            child: IconButton(
              iconSize: 40,
              onPressed: () async {
                await context.router.pop();
              },
              icon: SvgPicture.asset(
                "assets/images/back_icon.svg",
              ),
            ),
          ),
          title: Text(
            'Gia phả',
            style: TextStyles.medium16LineHeight24Sur
                .copyWith(color: AppColors.colorFFFBEFEF),
          ),
          backgroundColor: AppColors.colorFF940000,
          actions: [
            IconButton(
              iconSize: 40,
              onPressed: () {
                context.read<TreeByListCubit>().loadData(widget.idJafa);
              },
              icon: SvgPicture.asset(
                "assets/images/ic_search.svg",
              ),
            ),
            IconButton(
              iconSize: 40,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/ic_filter.svg",
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.colorFFFFFFFF,
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _timeLine('1', false, '9999', '9999'),
                      _timeLine('2', false, '9999', '9999'),
                      _timeLine('3', false, '9999', '9999'),
                      _timeLine('4', false, '9999', '9999'),
                      _timeLineEnd('5', true, '9999', '9999'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 300,
                child: MemberList(),
              )
            ],
          ),
        ));
  }

  Widget _timeLine(String number, bool isChoose, String start, String end) {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                start,
                style: TextStyles.bold14TitleBold.copyWith(
                    color: !isChoose
                        ? AppColors.colorFFDADADA
                        : AppColors.c000000_black),
              ),
              Container(
                width: 1,
                height: 15,
                color: !isChoose
                    ? AppColors.colorFFDADADA
                    : AppColors.c000000_black,
              ),
              Text(
                end,
                style: TextStyles.bold14TitleBold.copyWith(
                    color: !isChoose
                        ? AppColors.colorFFDADADA
                        : AppColors.c000000_black),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                    color: !isChoose
                        ? AppColors.colorFFDADADA
                        : AppColors.colorFFB20000,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Text(
                  number,
                  style: TextStyles.bold14TitleBold
                      .copyWith(color: AppColors.colorFFFFFFFF),
                ),
              ),
              Expanded(
                child: Container(
                  width: 1,
                  color: !isChoose
                      ? AppColors.colorFFDADADA
                      : AppColors.colorFFB20000,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeLineEnd(String number, bool isChoose, String start, String end) {
    Color colorDash =
        !isChoose ? AppColors.colorFFDADADA : AppColors.colorFFB20000;
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                start,
                style: TextStyles.bold14TitleBold.copyWith(
                    color: !isChoose
                        ? AppColors.colorFFDADADA
                        : AppColors.c000000_black),
              ),
              Container(
                width: 1,
                height: 15,
                color: !isChoose
                    ? AppColors.colorFFDADADA
                    : AppColors.c000000_black,
              ),
              Text(
                end,
                style: TextStyles.bold14TitleBold.copyWith(
                    color: !isChoose
                        ? AppColors.colorFFDADADA
                        : AppColors.c000000_black),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                    color: !isChoose
                        ? AppColors.colorFFDADADA
                        : AppColors.colorFFB20000,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Text(
                  number,
                  style: TextStyles.bold14TitleBold
                      .copyWith(color: AppColors.colorFFFFFFFF),
                ),
              ),
              CustomPaint(painter: LineDashedPainter(colorDash))
            ],
          ),
        ],
      ),
    );
  }
}

class LineDashedPainter extends CustomPainter {
  LineDashedPainter(this.colorDash);
  Color colorDash;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2
      ..color = colorDash;
    var max = 130;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MemberList extends StatelessWidget {
  const MemberList({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CartmemberDadWidget(title: 'Dad', onTap: () => {}),
        ),
        SizedBox(
          height: 610,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: GestureDetector(
                onTap: () async {
                  //context.read<HomeCubit>().getConservations();
                },
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: CartMemberWidget(
                        icon:
                            'https://media.sproutsocial.com/uploads/meme-example.jpg',
                        title: 'listMember![index].name',
                        content: 1,
                        onTap: () => {})),
              ));
            },
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CartMemberWidget extends StatelessWidget {
  CartMemberWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.content,
      required this.onTap});
  String? icon;
  String? title;
  int? content;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: icon != null
                      ? NetworkImage(icon!)
                      : const AssetImage("assets/images/user.png")
                          as ImageProvider<Object>)),
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 47,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Text(
                      title!,
                      style: TextStyles.regularBlackS14,
                    )
                  : Container(),
              content != null
                  ? Text(
                      'Đã mất $content',
                      style: TextStyles.small12LineHeight18BlackSur,
                    )
                  : Container()
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => onTap(),
        child: SvgPicture.asset(
          "assets/images/ic_arrow_right.svg",
        ),
      ),
    ]);
  }
}

// ignore: must_be_immutable
class CartmemberDadWidget extends StatelessWidget {
  CartmemberDadWidget({super.key, required this.title, required this.onTap});
  String? title;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.colorFFFBEFEF,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        title != null
            ? Text(
                title!,
                style: TextStyles.boldBlackS16
                    .copyWith(color: AppColors.colorFFB20000),
              )
            : Container(),
        GestureDetector(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset("assets/images/ic_circle_dot.svg",
                colorFilter: const ColorFilter.mode(
                    AppColors.colorFFB20000, BlendMode.srcIn)),
          ),
        ),
      ]),
    );
  }
}
