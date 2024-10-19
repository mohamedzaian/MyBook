import 'package:app_books/core/utils/response_height_width.dart';
import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/presentation/widgets/custom_button.dart';
import 'package:app_books/features/home/presentation/widgets/custom_image.dart';
import 'package:app_books/features/home/presentation/widgets/custom_text.dart';
import 'package:app_books/features/home/presentation/widgets/details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/media_quare.dart';
import '../manager/similar_cubit/similar_cubit.dart';
import 'custom_circular_progress_indicator.dart';
import 'custom_network_image.dart';

class DetailScreenBody extends StatefulWidget {
  DetailScreenBody({
    required this.book,
  });
  final BookModel book;
  BookModel? bookSelected;
  @override
  State<DetailScreenBody> createState() => _DetailScreenBodyState();
}

class _DetailScreenBodyState extends State<DetailScreenBody> {
  @override
  void initState() {
    widget.bookSelected = widget.book;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DetailsAppBar(),
        ResponsiveImage(
            url: widget.bookSelected!.volumeInfo.imageLinks.thumbnail),
         SizedBox(height: ResponseItems.responsiveHeight(context, 10)),
        Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: CustomText(
              text: widget.bookSelected!.volumeInfo.title,
              size: 25,
              alignmentGeometry: Alignment.center,
            )),
        SizedBox(height: ResponseItems.responsiveHeight(context, 4)),
        CustomText(
          text: widget.bookSelected!.volumeInfo.authors.first,
          size: 18,
          alignmentGeometry: Alignment.center,
          color: Colors.grey,
        ),
        SizedBox(height: ResponseItems.responsiveHeight(context, 40)),
        CustomButton(
          url: widget.bookSelected!.volumeInfo.previewLink,
        ),
        SizedBox(height: ResponseItems.responsiveHeight(context, 40)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'You can also like',
                size: 16,
              )),
        ),
        SizedBox(height: ResponseItems.responsiveHeight(context, 16)),
        BlocBuilder<SimilarCubit, SimilarState>(
          builder: (context, state) {
            if (state is SimilarSuccess) {
              for (int i = 0; i < state.books.length; i++) {
                if (widget.book.volumeInfo.title ==
                    state.books[i].volumeInfo.title) {
                  state.books.removeAt(i);
                }
              }
              return Container(
                height: getHeight(context) * 0.13,
                child: ListView.builder(
                    itemCount: state.books.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      BookModel book = state.books[index];

                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                               widget.bookSelected = book;
                              });
                            },
                            child: CustomCachedNetworkImage(
                                url: book.volumeInfo.imageLinks.thumbnail)),
                      );
                    }),
              );
            }
            if (state is SimilarFauleir) {
              return Text('Failed to load similar books');
            }
            return CustomCircularProgressIndicator();
          },
        )
      ],
    );
  }
}
