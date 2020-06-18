import 'package:flutter/material.dart';

class CardBackgroundPainter extends CustomPainter {
  final Color backgroundColor;

  CardBackgroundPainter({this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = backgroundColor;
    const radius = 25.0;
    const start = 0.0;
    final end = Offset(size.width, size.height);
    // START DRAW CONTAINER WITH RADIUS
    final p = Path();
    p.moveTo(radius, start);
    p.lineTo(end.dx - radius, start);
    p.quadraticBezierTo(end.dx, start, end.dx, radius);
    p.lineTo(end.dx, end.dy - radius);
    p.quadraticBezierTo(end.dx, end.dy, end.dx - radius, end.dy);
    p.lineTo(radius, end.dy);
    p.quadraticBezierTo(start, end.dy, start, end.dy - radius);
    p.lineTo(start, radius);
    p.quadraticBezierTo(start, start, radius, start);
    p.close();
    canvas.clipPath(p);
    canvas.drawRect(Rect.fromPoints(Offset.zero, end), white);
    // END DRAW CONTAINER WITH RADIUS

    //TODO: Draw artifacts
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
