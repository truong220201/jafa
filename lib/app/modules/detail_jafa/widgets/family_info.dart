import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';

import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/custom_buttom.dart';
import '../../../core/widgets/openImg/rating_open_image.dart';
import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';

class FamilyWidget extends StatelessWidget {
  const FamilyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void openImg(String imageUrl) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RatingOpenImgWidget(imageUrl: imageUrl)));
    }

    return BlocBuilder<TreeDetailCubit, TreeDetailState>(
        builder: (context, state) {
      return Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          child: InkWell(
            onTap: () {
              openImg(state.treeDetail!.image ??
                  'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg');
            },
            child: Image.network(
              state.treeDetail!.image ??
                  'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
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
                          state.treeDetail!.name ?? '',
                          style: TextStyles.medium16LineHeight24Sur,
                        ),
                        Text(
                          '${state.treeDetail!.level} ${StringConstants.levelLowcase} ${state.treeDetail!.relationName}',
                          style: TextStyles.medium14LineHeight21Sur,
                        )
                      ]),
                  const CustomButtonDetailPage(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.treeDetail!.description ?? '',
                  style: TextStyles.small12LineHeight18Sur,
                ),
              )
            ]))
      ]);
    });
  }
}

class CustomButtonDetailPage extends StatelessWidget {
  const CustomButtonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {context.read<TreeDetailCubit>().toTreeView(context)},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 178, 0, 0),
              borderRadius: BorderRadius.all(Radius.circular(33.5))),
          child: Text(
            StringConstants.seeTreeView,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
