import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

class PopupNotice extends StatelessWidget {
  const PopupNotice({
    super.key,
    required this.title,
    required this.textButton,
  });
  final String title;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.mediumMBlackS18,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side:
                  const BorderSide(color: AppColors.color4B000000, width: 2.0),
            ),
            primary: AppColors.colorFFFFFFFF,
            padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 10,),
          ),
          child: Text(
            textButton,
            style: TextStyles.mediumMBlueS16,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
