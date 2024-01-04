import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/core/values/string_constants.dart';

import '../../../core/values/app_colors.dart';

class IfNone extends StatelessWidget {
  const IfNone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        Center(
          child: Text(
            StringConstants.jafaInHere,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            StringConstants.youCanMemorize,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, color: Color.fromRGBO(173, 173, 173, 1)),
          ),
        ),
        const SizedBox(
          height: 68,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(StringConstants.createNow,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.colorFFB20000,
                    ))),
            Text(StringConstants.lowKeyOr),
            TextButton(
                onPressed: () {},
                child: Text(StringConstants.joinJafa,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.colorFFB20000,
                    ))),
          ],
        )
      ],
    );
  }
}
