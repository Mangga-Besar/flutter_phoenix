import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/place_holder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PictureFactory {
  static Widget build(
    String imageUrl, {
    BoxFit fit = BoxFit.cover,
    double placeholderRatioX = 16,
    double placeholderRatioY = 9,
    Widget? placeholder,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      fadeInCurve: Curves.fastOutSlowIn,
      progressIndicatorBuilder: (context, url, snapshot) =>
          placeholder ??
          Center(
            child: AspectRatio(
              aspectRatio: placeholderRatioX / placeholderRatioY,
              child: const SpinKitFadingCircle(
                color: Configs.secondaryColor,
              ),
            ),
          ),
      alignment: Alignment.center,
      errorWidget: (context, url, error) =>
          placeholder ??
          PlaceHolder(
            padding: padding,
            ratioX: placeholderRatioX,
            ratioY: placeholderRatioY,
          ),
    );
  }
}
