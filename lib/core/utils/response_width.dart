import 'package:flutter/material.dart';

class ResponseWidth extends StatelessWidget {
  const ResponseWidth({super.key, required this.ratio});
final double ratio ;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width:width * ratio ,
    );
  }
}
