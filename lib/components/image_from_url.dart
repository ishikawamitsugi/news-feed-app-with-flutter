import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  // stateLessWigetの変数はfinalで宣言する
  final String imageUrl;

  ImageFromUrl({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl == "") {
      return Icon(Icons.broken_image);
    } else {
      final isValidUrl = imageUrl.startsWith("http");
      if (!isValidUrl) {
        return Icon(Icons.broken_image);
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.broken_image),
        );
      }
    }
  }
}
