import 'package:flutter/material.dart';

class GroundWidget extends StatelessWidget {
  final double y;
  final double height;

  const GroundWidget({
    Key? key,
    required this.y,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: y,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.brown.shade600,
              Colors.brown.shade800,
            ],
          ),
          border: Border(
            top: BorderSide(
              color: Colors.brown.shade900,
              width: 3,
            ),
          ),
        ),
        child: CustomPaint(
          painter: GrassPainter(),
        ),
      ),
    );
  }
}

class GrassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.shade700
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (double x = 0; x < size.width; x += 15) {
      final y = 5.0;
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y - 10),
        paint,
      );
      canvas.drawLine(
        Offset(x, y),
        Offset(x - 3, y - 8),
        paint,
      );
      canvas.drawLine(
        Offset(x, y),
        Offset(x + 3, y - 8),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
