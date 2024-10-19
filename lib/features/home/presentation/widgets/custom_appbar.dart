import 'package:app_books/core/theme/cubit/app_theme_cubit.dart';
import 'package:app_books/core/theme/model/enum.dart';
import 'package:app_books/core/utils/assets.dart';
import 'package:app_books/core/utils/search_service.dart';
import 'package:app_books/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
      child: Row(
        children: [
          Image.asset(  AssetsData.logo ,height: 25,),
          Spacer(),
          IconButton(onPressed: (){

 showSearch(context: context, delegate: SearchService());

          }, icon: Icon(Icons.search , size: 35,) )
        ],
      ),
    );
  }
}
