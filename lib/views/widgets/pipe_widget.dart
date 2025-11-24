import 'package:flutter/material.dart';
import '../../models/bird_model.dart';

class PipeWidget extends StatelessWidget {
  final PipeModel pipe;

  const PipeWidget({
    Key? key,
    required this.pipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: pipe.x,
          top: 0,
          child: Container(
            width: pipe.width,
            height: pipe.topHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.green.shade700,
                  Colors.green.shade600,
                  Colors.green.shade700,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              border: Border.all(
                color: Colors.green.shade900,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
        ),
        Positioned(
          left: pipe.x - 5,
          top: pipe.topHeight - 20,
          child: Container(
            width: pipe.width + 10,
            height: 25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.green.shade800,
                  Colors.green.shade600,
                  Colors.green.shade800,
                ],
              ),
              border: Border.all(
                color: Colors.green.shade900,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Positioned(
          left: pipe.x,
          top: pipe.bottomY,
          child: Container(
            width: pipe.width,
            height: pipe.bottomHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.green.shade700,
                  Colors.green.shade600,
                  Colors.green.shade700,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              border: Border.all(
                color: Colors.green.shade900,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ),
        ),
        Positioned(
          left: pipe.x - 5,
          top: pipe.bottomY,
          child: Container(
            width: pipe.width + 10,
            height: 25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.green.shade800,
                  Colors.green.shade600,
                  Colors.green.shade800,
                ],
              ),
              border: Border.all(
                color: Colors.green.shade900,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
