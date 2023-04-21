import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/image_picker_helper.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';
import 'package:image_picker/image_picker.dart';

class ImageAddSingle extends StatefulWidget {
  final String? image;
  final bool? withCrop;
  final Function(XFile)? onChanged;

  ImageAddSingle({
    this.image,
    this.withCrop = false,
    this.onChanged,
  });

  @override
  _ImageAddSingleState createState() => _ImageAddSingleState();
}

class _ImageAddSingleState extends State<ImageAddSingle> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        XFile? file;
        if (widget.withCrop! && kIsWeb) {
          file = await ImagePickerHelper.openGallery(x: 1, y: 1);
        } else {
          file = await ImagePickerHelper.openGalleryWithoutCrop();
        }
        try {
          widget.onChanged!(file!);
        } catch (err) {
          ToastHelper.showException("Gagal mengupload Gambar", context);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: size.width * 0.75,
          height: size.width * 0.75,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: widget.image?.isEmpty ?? true
              ? Center(
                  child: Icon(Icons.add_circle, color: Colors.grey, size: 100),
                )
              : PictureFactory.build(
                  widget.image ?? "",
                  placeholder: LoadingFunction.loadingInfinte(),
                ),
        ),
      ),
    );
  }
}
