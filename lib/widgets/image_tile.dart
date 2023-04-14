import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/screens/viewer/viewer_screen.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class ImageTile extends StatefulWidget {
  final String imageData;
  final double? size;
  final Iterable<FocusedMenuItem> Function(String)? getMenus;

  ImageTile({required this.imageData, this.size, this.getMenus});

  @override
  _ImageTileState createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  @override
  Widget build(BuildContext context) {
    var menus = widget.getMenus?.call(widget.imageData) ?? [];
    return menus.length == 0 ? _imageItem() : _imageWithMenu(menus.toList());
  }

  Widget _imageWithMenu(List<FocusedMenuItem> menus) {
    return FocusedMenuHolder(
      child: _imageItem(),
      menuWidth: MediaQuery.of(context).size.width * 0.50,
      blurSize: 5.0,
      menuItemExtent: 45,
      menuBoxDecoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      duration: Duration(milliseconds: 200),
      animateMenuItems: true,
      blurBackgroundColor: Colors.transparent,
      menuOffset: 10.0,
      bottomOffsetHeight: 80.0,
      menuItems: menus,
      onPressed: () {},
    );
  }

  Widget _imageItem() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ViewerScreen(image: widget.imageData),
      )),
      child: Container(
        height: widget.size,
        width: widget.size,
        child: PictureFactory.build(
          widget.imageData,
          placeholder: LoadingFunction.loadingInfinte(),
        ),
      ),
    );
  }
}
