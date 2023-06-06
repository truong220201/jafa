import 'package:flutter/material.dart';

class CustomButtonDetailPage extends StatelessWidget {
  const CustomButtonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 178, 0, 0),
              borderRadius: BorderRadius.all(Radius.circular(33.5))),
          child: const Text(
            'Xem Cây',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
