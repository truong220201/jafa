import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/cart.dart';

class DomicileWidget extends StatelessWidget {
  const DomicileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringConstants.domicile),
            CartWidget(
                icon: SvgPicture.asset(
                  "assets/images/mapPinLine.svg",
                ),
                title: "Đông Triều, Quảng Ninh",
                content: 'Note note',
                onTap: () => {}),
          ],
        ));
  }
}
