import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/presentation/widgets/detail_screen_body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key  , required this.book});
final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
      body: DetailScreenBody(book: book,)
    );
  }
}
