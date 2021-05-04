library flutter_google_map_marker_icon;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_google_map_marker_icon/src/download_file.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'src/capture.dart';
import 'src/convert_image_file_to_bitmap_descriptor.dart';

class MarkerIcon {
  /// this will give you icon from your local asset
  static getIconFromAsset(assetUrl, {devicePixelRatio = 10}) async {
    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 10), assetUrl);
    return markerIcon;
  }

  /// this will change widget to marker. You can hide marker widgets below google map using stack
  static getIconFromWidget(widgetGlobalKey, {devicePixelRatio = 10}) async {
    BitmapDescriptor markerIcon =
        BitmapDescriptor.fromBytes(await capture(widgetGlobalKey));
    return markerIcon;
  }

  /// create map marker from any image on the internet
  static getIconFromUrl(imageUrl,
      {devicePixelRatio = 10,
      borderColor = Colors.transparent,
      titleBackgroundColor = Colors.black,
      borderSize = 8}) async {
    final file = await downloadFile(imageUrl);
    BitmapDescriptor markerIcon = await convertImageFileToBitmapDescriptor(file,
        borderColor: borderColor,
        titleBackgroundColor: titleBackgroundColor,
        borderSize: borderSize);

    return markerIcon;
  }
}
