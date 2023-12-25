import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/app_colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class RatingOpenImgWidget extends StatelessWidget {
  const RatingOpenImgWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(top: 20),
          child: InkWell(
            onTap: () => context.router.pop(),
            child: SvgPicture.asset(
              "assets/images/scanqr.svg",
              color: AppColors.c41BA72_success,
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imageUrl),
              initialScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
            );
          },
          itemCount: 1,
        ),
      ),
    );
  }

  void open(BuildContext context, int indexImg) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Container(
                  constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      PhotoViewGallery.builder(
                        scrollPhysics: const BouncingScrollPhysics(),
                        builder: (BuildContext context, int index) {
                          return PhotoViewGalleryPageOptions(
                            imageProvider: NetworkImage(imageUrl),
                            initialScale: PhotoViewComputedScale.contained,
                            heroAttributes:
                                PhotoViewHeroAttributes(tag: imageUrl),
                          );
                        },
                        itemCount: 1,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset("assets/images/scanqr.svg",
                              color: AppColors.c1D1D1D_onSurface,
                              height: 30,
                              width: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
