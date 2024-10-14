import 'package:app_books/core/utils/respons_text_method.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
   CustomText({super.key , this.size ,this.text , this.alignmentGeometry , this.color});
  String? text ;
  double? size;
  Color? color;
   AlignmentGeometry? alignmentGeometry;
  @override
  Widget build(BuildContext context) {
    return Text(text ?? 'Best Seller' , maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: getResponsiveFontSize(context, size ?? 20),
      fontWeight: FontWeight.bold,
        color: color ?? Colors.white


    ),

    );
  }
}
