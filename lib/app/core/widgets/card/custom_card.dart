import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_network/image_network.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.name,
    required this.content,
    this.image,
  });
  String name;
  String content;
  String? image =
      "https://www.imagenetwork.scaffoldtecnologia.com.br/flutter.jpg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
      child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 10, right: 5, bottom: 10),
                child: image == null
                    ? CircleAvatar(
                        child: Image.asset(
                            "assets/images/imagepng/image_scroll.png"),
                      )
                    : CircleAvatar(
                        child: ImageNetwork(
                        image: image!,
                        imageCache: CachedNetworkImageProvider(image!),
                        height: 150,
                        width: 150,
                        duration: 1500,
                        curve: Curves.easeIn,
                        onPointer: true,
                        debugPrint: false,
                        fullScreen: false,
                        fitAndroidIos: BoxFit.cover,
                        fitWeb: BoxFitWeb.cover,
                        borderRadius: BorderRadius.circular(70),
                        onLoading: const CircularProgressIndicator(
                          color: Colors.indigoAccent,
                        ),
                        onError: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        onTap: () {
                          debugPrint("©gabriel_patrick_souza");
                        },
                      )),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text(name), Text(content)],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SvgPicture.asset(
                  "assets/images/iconMore.svg",
                  //color: const Color.fromARGB(255, 3, 3, 3),
                ),
              ),
            ],
          )),
    );
  }
}
