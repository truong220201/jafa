import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.name,
    required this.content,
  });
  String name;
  String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31, vertical: 10),
      child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 70,
          decoration: new BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: new BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CircleAvatar(
                    // backgroundImage:
                    //     AssetImage("assets/images/user.png"),
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text(name), Text(content)],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CircleAvatar(
                    // backgroundImage:
                    //     AssetImage("assets/images/user.png"),
                    ),
              ),
            ],
          )),
    );
  }
}
