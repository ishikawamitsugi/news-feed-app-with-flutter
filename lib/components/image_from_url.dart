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
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.broken_image),
        );
      }
    }
  }
}
