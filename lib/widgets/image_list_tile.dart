import 'package:flutter/material.dart';
import 'package:flutter_phoenix/widgets/image_tile.dart';
import 'package:focused_menu/modals.dart';

class ImageListTile extends StatefulWidget {
  final List<String>? images;
  final double? size;
  final Iterable<FocusedMenuItem> Function(String)? getMenus;

  ImageListTile({this.images, this.size, this.getMenus});

  @override
  _ImageListTileState createState() => _ImageListTileState();
}

class _ImageListTileState extends State<ImageListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.size,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getWidgets().toList(),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Iterable<Widget> _getWidgets() sync* {
    var counter = 0;
    while (counter < 3) {
      if (widget.images!.length > counter) {
        var data = widget.images![counter];
        yield _image(data);
      } else {
        yield Container(width: widget.size, height: widget.size);
      }
      counter++;
    }
  }

  Widget _image(String image) {
    return ImageTile(
      imageData: image,
      size: widget.size,
      getMenus: widget.getMenus,
    );
  }
}
