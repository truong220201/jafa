import 'package:flutter/material.dart';

import '../../core/values/app_colors.dart';
import '../../core/values/text_styles.dart';

class CreateBranchView extends StatefulWidget {
  const CreateBranchView({Key? key}) : super(key: key);

  @override
  State<CreateBranchView> createState() => _CreateBranchViewState();
}

class _CreateBranchViewState extends State<CreateBranchView> {
  GlobalKey actionMenuKey = GlobalKey();
  bool showPopUp = false;
  bool hasFather = false;

  void showActionMenu(BuildContext context) {
    final RenderBox buttonBox =
        actionMenuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset buttonPosition = buttonBox.localToGlobal(Offset.zero);
    final RelativeRect position = RelativeRect.fromLTRB(
      buttonPosition.dx + buttonBox.size.width - 10,
      buttonPosition.dy + buttonBox.size.height - 150,
      buttonPosition.dx + buttonBox.size.width + 10,
      buttonPosition.dy + buttonBox.size.height + 150,
    );

    final List<PopupMenuEntry<int>> menuItems = [
      PopupMenuItem<int>(
        value: 1,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
                color: hasFather
                    ? AppColors.colorFF808089
                    : AppColors.colorFFFBEFEF,
                border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.add_circle_outline,
                  color: hasFather
                      ? AppColors.colorFF000000
                      : AppColors.colorFF940000,
                ),
                SizedBox(width: 12),
                Text('Cha', style: TextStyles.mediumMBlackS18),
              ],
            ),
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 2,
        child: InkWell(
          onTap: () {
            if (!hasFather) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Trước tiên bạn phải có bố'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
                color: AppColors.colorFFFBEFEF, border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.add_circle_outline,
                  color: AppColors.colorFF940000,
                ),
                SizedBox(width: 12),
                Text('Mẹ', style: TextStyles.mediumMBlackS18),
              ],
            ),
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 3,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
                color: AppColors.colorFFFBEFEF, border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.add_circle_outline,
                  color: AppColors.colorFF940000,
                ),
                SizedBox(width: 12),
                Text('Vợ/Chồng', style: TextStyles.mediumMBlackS18),
              ],
            ),
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 4,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
                color: AppColors.colorFFFBEFEF, border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.add_circle_outline,
                  color: AppColors.colorFF940000,
                ),
                SizedBox(width: 12),
                Text('Con cái', style: TextStyles.mediumMBlackS18),
              ],
            ),
          ),
        ),
      ),
      PopupMenuItem<int>(
        value: 5,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
                color: AppColors.colorFFFBEFEF, border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.add_circle_outline,
                  color: AppColors.colorFF940000,
                ),
                SizedBox(width: 12),
                Text('Khác', style: TextStyles.mediumMBlackS18),
              ],
            ),
          ),
        ),
      ),
    ];

    showMenu<int>(
      color: Colors.transparent,
      context: context,
      position: position,
      items: menuItems,
    ).then((selectedValue) {
      if (selectedValue != null) {
        // Xử lý khi lựa chọn được chọn
      }
      setState(() {
        showPopUp = false;
      });
    });
    setState(() {
      showPopUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFFFFFFFF,
      body: IconButton(
        key: actionMenuKey,
        icon: !showPopUp
            ? Icon(
                Icons.add_circle_outline,
                color: AppColors.colorFFB20000,
                size: 40,
              )
            : Icon(
                Icons.remove_circle_outline,
                color: AppColors.colorFFB20000,
                size: 40,
              ),
        onPressed: () {
          showActionMenu(context);
        },
      ),
    );
  }
}
