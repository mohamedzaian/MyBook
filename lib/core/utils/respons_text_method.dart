import 'package:flutter/material.dart';

double getResponsiveFontSize (BuildContext context , double fontSize)
{
  double scaleFactor = getScaleFactor(context);
  double responseFontsize = scaleFactor * fontSize;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;


  return responseFontsize.clamp(lowerLimit, upperLimit);
}
double getScaleFactor (BuildContext context)
{
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600)
  {
    return width / 400;
  }
  else if (width < 900)
  {
    return width / 700;
  }
  else

    return width / 1000;




}