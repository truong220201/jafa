import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/text_styles.dart';
import '../cubit/tree_view_cubit.dart';

class ModalMenu extends StatefulWidget {
  const ModalMenu({super.key});

  @override
  State<ModalMenu> createState() => _ModalMenuState();
}

class _ModalMenuState extends State<ModalMenu> {
  List<bool> checkList = [true, true, true, true, true];
  void checkBox(int index) {
    setState(() {
      checkList[index] = !checkList[index];
    });
    for (int i = 1; i < checkList.length; i++) {
      bool sameCheck = false;
      if (checkList[i] == true) {
        sameCheck = true;
      } else {
        sameCheck = false;
        setState(() {
          checkList[0] = false;
        });
        break;
      }
      if (sameCheck == true) {
        setState(() {
          checkList[0] = true;
        });
      }
    }
  }

  void checkAll() {
    setState(() {
      checkList[0] = !checkList[0];
    });
    debugPrint(checkList[0].toString());
    if (checkList[0] == false) {
      setState(() {
        for (int i = 1; i < checkList.length; i++) {
          checkList[i] = false;
        }
      });
    } else {
      setState(() {
        for (int i = 1; i < checkList.length; i++) {
          checkList[i] = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<TreeViewCubit>().changeModal(),
      child: Container(
        alignment: Alignment.topRight,
        decoration:
            const BoxDecoration(color: Color.fromARGB(141, 133, 133, 133)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: 190,
              height: 310,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Bộ lọc thành viên',
                      style: TextStyles.bold14TitleBold,
                    ),
                  ),
                  _cardMini(context, 0, 'Tất cả', () => checkAll()),
                  _cardMini(context, 1, 'Con trai', () => checkBox(1)),
                  _cardMini(context, 2, 'Con gái', () => checkBox(2)),
                  _cardMini(context, 3, 'Con rể', () => checkBox(3)),
                  _cardMini(context, 4, 'Con dâu', () => checkBox(4)),
                ],
              )),
        ),
      ),
    );
  }

  Widget _cardMini(
      BuildContext context, int index, String content, Function onTapp) {
    return GestureDetector(
      onTap: () => onTapp(),
      child: Container(
        width: double.infinity,
        //padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Checkbox(
            checkColor: Colors.greenAccent,
            activeColor: const Color.fromARGB(255, 255, 17, 0),
            value: checkList[index],
            onChanged: (bool? value) {
              //onTapp();
            },
          ),
          Text(content)
        ]),
      ),
    );
  }
}
