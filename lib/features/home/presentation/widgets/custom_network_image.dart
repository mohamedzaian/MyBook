import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.url});
final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage (imageUrl: url ,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Text('Error loading image'),

    );
  }
}
