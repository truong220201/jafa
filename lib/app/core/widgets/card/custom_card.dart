import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_network/image_network.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.name,
    required this.content,
    this.image,
  });
  String name;
  String content;
  String? image;

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
                        child: Image.asset("assets/images/user.png"),
                      )
                    : CircleAvatar(
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/user.png",
                          image:
                              "https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-600x600.jpg",
                        ),
                      ),
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
