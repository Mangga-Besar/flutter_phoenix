import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';

class PlaceHolder extends StatefulWidget {
  final double ratioX;
  final double ratioY;

  PlaceHolder({this.ratioX = 16, this.ratioY = 9});

  @override
  _PlaceHolderState createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.ratioX / widget.ratioY,
      child: Container(
        color: Configs.quardiaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Image.asset('assets/logo_square.png', height: 125),
          ),
        ),
      ),
    );
  }
}
