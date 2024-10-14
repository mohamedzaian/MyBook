import 'package:app_books/constant.dart';
import 'package:app_books/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.close)),
        actions: [
          Icon(Icons.shopping_cart)
        ],
      ),
    );
  }
}
