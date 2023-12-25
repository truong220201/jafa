import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/values/text_styles.dart';

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
                      style: TextStyles.medium16LineHeight24Sur,
                    )
                  : Container(),
              content != null
                  ? Text(
                      _roleName(content!),
                      style: TextStyles.small12LineHeight18BlackSur,
                    )
                  : Container()
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            "assets/images/ic_three_dots.svg",
          ),
        ),
      ),
    ]);
  }

  String _roleName(int idRole) {
    String roleName = '';
    if (idRole == 1) {
      roleName = 'Quản trị viên';
    } else if (idRole == 2) {
      roleName = 'Người biên soạn';
    } else if (idRole == 3) {
      roleName = 'Được chỉnh sửa';
    } else if (idRole == 4) {
      roleName = 'Chỉ xem';
    }
    return roleName;
  }
}
