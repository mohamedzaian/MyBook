import 'package:flutter/cupertino.dart';
class ResponseItems {
   static double responsiveHeight(BuildContext context, double height) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (height / screenHeight);
  }

   static double responsiveWidth(BuildContext context, double width) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (width / screenHeight);
  }
}