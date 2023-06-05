import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

// ignore: must_be_immutable
class CustomRadioField extends StatelessWidget {
  CustomRadioField({
    Key? key,
    required this.actions,
    required this.groupValue,
    required this.labels,
    required this.onChanged,
  }) : super(key: key);
  final List<dynamic> actions;
  final dynamic groupValue;
  final List<String> labels;
  void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var i = 0; i < actions.length; i++)
          if (i == actions.length - 1)
            Expanded(
              child: CustomRadioTileField(
                label: labels[i],
                value: actions[i],
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            )
          else
            CustomRadioTileField(
              label: labels[i],
              value: actions[i],
              groupValue: groupValue,
              onChanged: onChanged,
            ),
      ],
    );
  }
}

class CustomRadioTileField extends StatelessWidget {
  final String label;
  final Object value;
  final Object? groupValue;
  final void Function(Object?)? onChanged;

  const CustomRadioTileField({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = AppColors.colorFF940000;
    return InkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.colorFFC5C5C5,
                width: 1,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: groupValue == value ? activeColor : Colors.transparent,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyles.regularBlackS14,
          ),
          const SizedBox(width: 34),
        ],
      ),
    );
  }
}
