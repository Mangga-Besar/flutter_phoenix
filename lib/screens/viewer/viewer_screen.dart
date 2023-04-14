import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/screen_detector.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';
import 'package:flutter_phoenix/widgets/zoom.dart';

class ViewerScreen extends StatefulWidget {
  final String image;

  ViewerScreen({required this.image});

  @override
  _ViewerScreenState createState() => _ViewerScreenState();
}

class _ViewerScreenState extends State<ViewerScreen> {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.black,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Zoom(
                child: Center(
                  child: PictureFactory.build(widget.image),
                ),
              ),
              Positioned(
                left: ScreenDetector.isWeb(context) ? 15 : 5,
                top: ScreenDetector.isWeb(context)
                    ? MediaQuery.of(context).padding.top + 15
                    : 10,
                child: const BackButton(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
