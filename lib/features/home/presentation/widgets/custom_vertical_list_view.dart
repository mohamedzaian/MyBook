import 'package:app_books/core/utils/respons_text_method.dart';
import 'package:app_books/features/home/presentation/details_screen.dart';
import 'package:app_books/features/home/presentation/manager/news_cubit/newest_cubit.dart';
import 'package:app_books/features/home/presentation/widgets/custom_horizontal_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/model/book_model.dart';

class CustomVerticalList extends StatelessWidget {
  const CustomVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<NewestCubit, NewestState>(
      builder: (context, state) {
        if (state is NewestSuccess)
          return Expanded(
            child: ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  BookModel books = state.books[index];
                  return GestureDetector(
                    onTap:() {
                      Get.to(() =>
                          DetailsScreen(
                            book: books,)
                      );
                    },

                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: books.volumeInfo.imageLinks.thumbnail,
                            height: height * .14,
                            width: width * .18,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * .4,
                                child: Text(
                                  books.volumeInfo.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize:
                                          getResponsiveFontSize(context, 20)),
                                ),
                              ),
                              Text(
                                books.volumeInfo.authors.first,
                                style: TextStyle(
                                  fontSize: getResponsiveFontSize(
                                    context,
                                    14,
                                  ),
                                  color: Colors.grey,
                                ),
                              ),
                              Text('Free',
                                  style: TextStyle(
                                      fontSize:
                                          getResponsiveFontSize(context, 20))),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        if (state is NewestFauiler) {
          return Center(
            child: Text(state.errorMsg),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
