import 'package:flutter/material.dart';

class AllLink extends StatelessWidget {
  const AllLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Containerlink(
          childContainer:
              _linkToContainer(context, true, _container(context, 100), 100),
        )
      ],
    );
  }
}

class Containerlink extends StatelessWidget {
  const Containerlink({super.key, required this.childContainer});
  final Widget childContainer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _container(context, 100),
        SizedBox(
          width: 200,
          child: Row(
            children: [
              _linkToContainer(context, true, const ContainerlinkChild(), 100),
              _linkToContainer(context, false, const ContainerlinkChild(), 100)
            ],
          ),
        )
      ],
    );
  }
}

class ContainerlinkChild extends StatelessWidget {
  const ContainerlinkChild({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _container(context, 100),
        SizedBox(
          width: 200,
          child: Row(
            children: [
              _linkToContainer(context, true, _container(context, 100), 100),
              _linkToContainer(context, false, _container(context, 100), 100)
            ],
          ),
        )
      ],
    );
  }
}

Widget _linkToContainer(
    BuildContext context, bool insertLeft, Widget child, double linkWidth) {
  bool insertLeftt = insertLeft;

  double length = 0;
  double n = 1;

  return SizedBox(child: LayoutBuilder(builder: (context, constraints) {
    debugPrint('------------max width = ' + constraints.maxWidth.toString());
    return Column(
      children: [
        _link(context, insertLeft, linkWidth),
        Transform.translate(
          offset: Offset(insertLeftt ? -50 : 50, 0),
          child: child,
        ),
        //SizedBox(width: 100, child: _container(context))
      ],
    );
  }));
}

Widget _link(BuildContext context, bool insertLeft, double width) {
  bool insertLeftt = insertLeft;

  return SizedBox(
    width: width,
    child: CustomPaint(
      painter: insertLeftt ? ShapePainterLeft() : ShapePainterRight(),
      child: Container(
        width: 100,
        height: 50,
      ),
    ),
  );
}

//nhieu link re nhanh
Widget _linkK(BuildContext context, bool insertLeft) {
  bool insertLeftt = insertLeft;

  double length = 0;
  double n = 0;
  return SizedBox(
    child: Stack(
      children: [
        CustomPaint(
          painter: insertLeftt ? ShapePainterLeft() : ShapePainterRight(),
          child: Container(
            width: 100,
            height: 50,
          ),
        ),
        for (int i = 0; i < length; i++)
          Positioned(
            left: n += 70,
            child: CustomPaint(
              painter: ShapePainterSubRight(),
              child: Container(
                width: 100,
                height: 50,
              ),
            ),
          )
      ],
    ),
  );
}

Widget _container(BuildContext context, double width) {
  return Container(
    width: width,
    height: 100,
    alignment: Alignment.center,
    decoration: const BoxDecoration(color: Colors.amber),
    child: const Text('data'),
  );
}

class LinkToContainer extends StatelessWidget {
  const LinkToContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _container(context, 100),
        SizedBox(
          width: 200,
          child: Row(
            children: [
              _linkK(context, true),
              _linkK(context, false),
            ],
          ),
        )
      ],
    );
  }
}

class ShapePainterSubRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Offset startingPoint = Offset(0, size.height / 2);

    // Offset endingPoint = Offset(size.width, size.height / 2);
    var path = Path()..moveTo(0, size.height / 2);
    var firstStart = Offset(size.width / 12, size.height / 2);
    var firstEnd = Offset(size.width / 3, size.height / 2);
    // path.quadraticBezierTo(
    //     firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width / 1.5, size.height / 2);

    var seccondStart = Offset(size.width - size.width / 12, size.height / 2);
    var seccondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        seccondStart.dx, seccondStart.dy, seccondEnd.dx, seccondEnd.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// FOR PAINTING LINES
class ShapePainterRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Offset startingPoint = Offset(0, size.height / 2);

    // Offset endingPoint = Offset(size.width, size.height / 2);
    var path = Path();
    var firstStart = Offset(size.width / 12, size.height / 2);
    var firstEnd = Offset(size.width / 3, size.height / 2);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width / 1.5, size.height / 2);

    var seccondStart = Offset(size.width - size.width / 12, size.height / 2);
    var seccondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        seccondStart.dx, seccondStart.dy, seccondEnd.dx, seccondEnd.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// FOR PAINTING LINES
class ShapePainterLeft extends CustomPainter {
  //const ShapePainterLeft(double length, );
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path()..moveTo(0, size.height);

    var seccondStart = Offset(size.width / 12, size.height / 2);
    var seccondEnd = Offset(size.width / 2, size.height / 2);

    path.quadraticBezierTo(
        seccondStart.dx, seccondStart.dy, seccondEnd.dx, seccondEnd.dy);

    path.lineTo(size.width / 1.5, size.height / 2);

    var firstStart = Offset(size.width - size.width / 12, size.height / 2);
    var firstEnd = Offset(size.width, 0);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var seccondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var seccondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        seccondStart.dx, seccondStart.dy, seccondEnd.dx, seccondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
