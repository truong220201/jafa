import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        child: AppBar(
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
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/scanqr.svg",
              ),
            )
          ],
          backgroundColor: AppColors.colorFF940000,
        ),
      ),
    );
  }
}
