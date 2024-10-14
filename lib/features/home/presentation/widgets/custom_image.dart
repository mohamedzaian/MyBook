import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(), // مؤشر التحميل
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error), // عرض رمز خطأ عند فشل تحميل الصورة
          ),
        ),
      ),
    );
  }
}
class ResponsiveImage extends StatelessWidget {
  const ResponsiveImage({super.key, required this.url});
final String url;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomImage(imageUrl:url ),
    );
    ;
  }
}

