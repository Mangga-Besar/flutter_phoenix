import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerHelper {
  static ImagePicker imagePicker = ImagePicker();

  static Future<XFile?> openGallery({double x = 1, double y = 1}) async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (kIsWeb) return pickedImage;
    return pickedImage == null ? null : await cropImage(pickedImage, x, y);
  }

  static Future<XFile?> openGalleryWithoutCrop() async {
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> cropImage(XFile? image, double x, double y) async {
    var file = await ImageCropper().cropImage(
      sourcePath: image!.path,
      cropStyle: CropStyle.rectangle,
      aspectRatio: CropAspectRatio(ratioX: x, ratioY: y),
    );
    var data = await file?.readAsBytes();
    return data == null ? null : XFile.fromData(data);
  }

  static AndroidUiSettings get androidSettings => AndroidUiSettings(
        toolbarTitle: "Potong Gambar",
        toolbarColor: Configs.primaryColor,
        toolbarWidgetColor: Colors.white,
        statusBarColor: Configs.statusBarColor,
        cropGridStrokeWidth: 4,
        cropFrameStrokeWidth: 4,
        activeControlsWidgetColor: Configs.secondaryColor,
      );

  static IOSUiSettings get iosSettings => IOSUiSettings(
        title: "Potong Gambar",
        cancelButtonTitle: "Batal",
        doneButtonTitle: "Selesai",
      );
}
