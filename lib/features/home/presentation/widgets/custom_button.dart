import 'package:app_books/core/utils/url_luncher.dart';
import 'package:app_books/features/home/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.url});
final String url;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return  GestureDetector(
      onTap: () async
      {
      await  urlLauncher(url);
      },
      child: Container(

        child:
        Center(
          child: CustomText(text: 'Free Preview', size: 20,alignmentGeometry: Alignment.center,),
        ),
        height: width * 0.1,
        width: width * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffEF8262),
        ),
      ),
    );
  }
}
