import 'package:flutter/material.dart';

class ResponseHeight extends StatelessWidget {
  const ResponseHeight({super.key, required this.ratio});
final double ratio ;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return  SizedBox(
      height: height  * ratio ,
    );
  }
}
