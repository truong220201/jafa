import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';
import 'package:genealogy_management/app/core/widgets/search/custom_search.dart';
import 'package:genealogy_management/app/modules/tree_view/widgets/search_tree_view.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/primary_button.dart';
import '../cubit/tree_view_cubit.dart';
import '../cubit/tree_view_state.dart';

class SearchPopup extends StatelessWidget {
  const SearchPopup({super.key, required this.transformationController});
  final TransformationController transformationController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreeViewCubit, TreeViewState>(builder: (context, state) {
      //debugPrint('aaa' + state.treeViewModel.toString());
      return GestureDetector(
        onTap: () => context.read<TreeViewCubit>().changeShowSearch(),
        child: Container(
          alignment: Alignment.topCenter,
          decoration:
              const BoxDecoration(color: Color.fromARGB(141, 133, 133, 133)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchTreeView(
                      kOptions: state.listName,
                      transformationController: transformationController,
                    )
                  ],
                )),
          ),
        ),
      );
    });
  }
}
