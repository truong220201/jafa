import 'package:flutter/material.dart';

import '../../values/text_styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.icon, required this.name, required this.onTap});
  final Widget icon;
  final String name;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
          onTap: () => onTap,
          child: Column(children: [
            icon,
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyles.small12LineHeight18BlackSur,
            )
          ])),
    );
  }
}
