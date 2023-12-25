import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageView extends StatelessWidget {
  const AssetImageView({
    Key? key,
    required this.fileName,
    this.height,
    this.width,
    this.color,
    this.scale,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String fileName;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return _getView();
  }

  Widget _getView() {
    String mimType = fileName.split(".").last;
    String path = "assets/images/$fileName";

    if (mimType.isEmpty) {
      return Icon(
        Icons.image_not_supported_outlined,
        size: width,
        color: color,
      );
    }

    switch (mimType) {
      case "svg":
        return SvgPicture.asset(
          path,
          height: height,
          width: width,
          color: color,
        );
      case "png":
      case "jpg":
      case "jpeg":
        return Image.asset(
          path,
          height: height,
          width: width,
          color: color,
          scale: scale,
          fit: fit,
        );
      default:
        return Icon(
          Icons.image_not_supported_outlined,
          size: width,
          color: color,
        );
    }
  }
}
