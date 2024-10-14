import 'package:app_books/core/utils/respons_text_method.dart';
import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/presentation/details_screen.dart';
import 'package:app_books/features/home/presentation/manager/featured_books_cubits/featured_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is FeaturedSuccess) {
          return Expanded(
              child: ListView.builder(
                  itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    BookModel book = state.books[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(() => DetailsScreen(
                              book:book,));
                            setState(() {

                            });
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: book.volumeInfo.imageLinks.thumbnail,
                                fit: BoxFit.fill,
                              ))),
                    );
                  }));
        }
        if (state is FeaturedFauleir)
          {
            return Center(
              child: Text(state.errorMessage , style: TextStyle(
                fontSize: getResponsiveFontSize(context, 30)
              ),),
            );
          }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
