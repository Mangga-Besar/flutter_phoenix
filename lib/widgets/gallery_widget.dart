import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/upload/firebase_uploader_helper.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/circle_button.dart';
import 'package:flutter_phoenix/widgets/image_list_tile.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class GalleryWidget extends StatefulWidget {
  final String? name;
  final List<String>? images;
  final User? user;

  GalleryWidget({this.name, this.images, this.user});

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  ImagePicker? imagePicker;

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = (MediaQuery.of(context).size.width - 60) / 3;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          _buttons(),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemLines(),
              itemBuilder: (context, i) {
                final images = widget.images!
                    .sublist(i * 3, min(i * 3 + 3, widget.images!.length))
                    .toList();

                return ImageListTile(
                  images: images,
                  size: size,
                  getMenus: (image) => [
                    FocusedMenuItem(
                      title: const Text(
                        "Hapus",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      trailingIcon: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        widget.images!.remove(image);
                        setState(() {});
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: <Widget>[
          Spacer(),
          CircleButton(
            iconData: Icons.image,
            iconSize: 25,
            size: 35,
            padding: EdgeInsets.zero,
            onPressed: () => _getImage(context, ImageSource.gallery),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Future<void> _getImage(BuildContext context, ImageSource source) async {
    var image = await imagePicker!.pickImage(source: source);
    var helper = FirebaseUploaderHelper(
      filePath: image,
      name: "PESERTA_" + widget.name!,
      onComplete: (data) async {
        widget.images!.add(data);
        setState(() {});
      },
      user: widget.user,
    );
    await helper.upload();
  }

  int itemLines() {
    var lines = (widget.images!.length / 3).floor();
    if (widget.images!.length % 3 != 0) lines++;
    return lines;
  }
}
