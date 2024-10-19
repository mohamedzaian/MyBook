import 'package:app_books/core/utils/respons_text_method.dart';
import 'package:app_books/core/utils/response_height_width.dart';
import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/data/repos/search_repo.dart';
import 'package:app_books/features/home/presentation/manager/search_cubits/search_cubit.dart';
import 'package:app_books/features/home/presentation/widgets/custom_vertical_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/details_screen.dart';
import '../../features/home/presentation/manager/news_cubit/newest_cubit.dart';

class SearchService extends SearchDelegate

{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: ()
        {
          query ='';
        }, icon:Icon(Icons.close) )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          List filter = state.list
              .where((item) => item.volumeInfo.title
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
          return Expanded(
            child: ListView.builder(
                itemCount: query == '' ? state.list.length : filter.length,
                itemBuilder: (context, index) {
                  BookModel books = query == ''  ? state.list[index] : filter[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsScreen(
                            book: books,
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: books.volumeInfo.imageLinks.thumbnail,
                            height:
                                ResponseItems.responsiveHeight(context, 105),
                            width: ResponseItems.responsiveWidth(context, 70),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:
                                    ResponseItems.responsiveWidth(context, 145),
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
        }
        if (state is SearchFauiler) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
  
}