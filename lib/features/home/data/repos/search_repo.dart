import 'package:app_books/core/utils/api_service.dart';
import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/data/repos/home_repo_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/lacator_service.dart';

class SearchRepo
{
  Future<List<BookModel>> getBooks()async
  {
    final data = await HomeRepoImpl(ApiService(dio: Dio())).fetchFeaturedBooks();
    final data2 = await HomeRepoImpl(ApiService(dio: Dio())).fetchNewestBooks();
List<BookModel> books = [];
data.fold((left)
  {

  }, (right)

{
  books.addAll(right);
});
data2.fold((left)
  {

  }, (right)

{
  books.addAll(right);
});


return books;



  }
}

