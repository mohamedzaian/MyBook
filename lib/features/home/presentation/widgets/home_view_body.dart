import 'package:app_books/features/home/presentation/widgets/custom_appbar.dart';
import 'package:app_books/features/home/presentation/widgets/custom_horizontal_list_view.dart';
import 'package:app_books/features/home/presentation/widgets/custom_text.dart';
import 'package:app_books/features/home/presentation/widgets/custom_vertical_list_view.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .sizeOf(context)
        .height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
           const CustomAppBar(),
          SizedBox(
            height: height * 0.04,
          ),
          CustomListView(),

          SizedBox(
            height: height * 0.04,
          ),
          CustomText(),
          SizedBox(
            height: height * 0.02,
          ),
          CustomVerticalList(),


        ],
      ),
    );
  }
}



