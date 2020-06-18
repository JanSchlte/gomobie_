import 'package:flutter/material.dart';

class HomePainter extends CustomPainter {
  final Color backgroundColor;

  HomePainter({this.backgroundColor = const Color(0xFFFFFFFF)});

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = backgroundColor;
    final end = Offset(size.width, size.height);
    // START DRAW CONTAINER WITH RADIUS
    final p = CircularNotchedRectangle().getOuterPath(
        Rect.fromPoints(Offset.zero, end),
        Rect.fromPoints(
            Offset(size.width / 2 - 26, 1), Offset(size.width / 2 + 26, 1)));

    p.close();
    //canvas.clipPath(p);
    canvas.clipPath(p);
    canvas.drawRect(Rect.fromPoints(Offset.zero, end), white);
    // END DRAW CONTAINER WITH RADIUS
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
