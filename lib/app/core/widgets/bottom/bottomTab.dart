import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/app_colors.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.colorFFB20000,
      unselectedItemColor: AppColors.colorFFFFFFFF,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/treehome.svg",
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/bag.svg",
            ),
            label: "Bag"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/ring.svg",
            ),
            label: "Ring"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/personal.svg",
            ),
            label: "Personal")
      ],
      onTap: (int index) async {
        switch (index) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
        }
      },
    );
  }
}
