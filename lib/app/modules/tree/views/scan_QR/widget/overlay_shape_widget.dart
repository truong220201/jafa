import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../../core/analytics/analytics_manager.dart';
import '../../../../../core/analytics/route_aware_analytics.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/text_styles.dart';

class OverlayShape extends StatelessWidget {
  const OverlayShape({Key? key}) : super(key: key);

  //final OverlayModel model;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var size = media.size;
    double width = media.orientation == Orientation.portrait
        ? size.shortestSide * .9
        : size.longestSide * .5;
    double padding = (size.width - width) / 2;

    double ratio = 9;
    double height = width;
    double radius = 9;
    if (media.orientation == Orientation.portrait) {}
    return Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(200, 217, 217, 217), BlendMode.srcOut),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 128,
                  right: padding,
                  left: padding,
                  child: Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(radius)),
                    child: Center(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 128,
            left: padding,
            child: Container(
              width: width,
              height: width,
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
}
