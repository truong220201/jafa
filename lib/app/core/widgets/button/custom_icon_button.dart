import 'package:flutter/material.dart';

import '../../values/text_styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.name,
  });
  final Icon icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
          onTap: () => {},
          child: Column(children: [
            icon,
            Text(
              name,
              style: TextStyles.small12LineHeight18BlackSur,
            )
          ])),
    );
  }
}
