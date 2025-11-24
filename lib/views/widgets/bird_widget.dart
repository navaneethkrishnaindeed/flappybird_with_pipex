import 'package:flutter/material.dart';
import '../../models/bird_model.dart';
import 'dart:math' as math;

class BirdWidget extends StatelessWidget {
  final double x;
  final double y;
  final double rotation;
  final bool isAlive;

  const BirdWidget({
    Key? key,
    required this.x,
    required this.y,
    required this.rotation,
    required this.isAlive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x - BirdModel.radius,
      top: y - BirdModel.radius,
      child: Transform.rotate(
        angle: rotation * math.pi / 180,
        child: Container(
          width: BirdModel.radius * 2,
          height: BirdModel.radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isAlive ? Colors.yellow.shade700 : Colors.grey.shade600,
            border: Border.all(
              color: isAlive ? Colors.orange.shade900 : Colors.grey.shade800,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 8,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isAlive ? Colors.white : Colors.grey.shade400,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 18,
                child: Container(
                  width: 12,
                  height: 6,
                  decoration: BoxDecoration(
                    color:
                        isAlive ? Colors.orange.shade700 : Colors.grey.shade700,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
