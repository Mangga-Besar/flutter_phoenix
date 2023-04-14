import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class Zoom extends StatefulWidget {
  final Widget? child;

  const Zoom({Key? key, this.child}) : super(key: key);
  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  Matrix4 matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() => matrix = Matrix4.identity());
      },
      child: MatrixGestureDetector(
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() => matrix = m);
        },
        child: Transform(
          transform: matrix,
          child: widget.child,
        ),
      ),
    );
  }
}
