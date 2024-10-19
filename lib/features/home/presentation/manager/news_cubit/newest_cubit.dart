import 'package:app_books/core/utils/api_service.dart';
import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/data/repos/home_repo.dart';
import 'package:app_books/features/home/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  NewestCubit(this.homeRepo) : super(NewestInitial());
  final HomeRepoImpl homeRepo;
 void getNewestBook()async
  {
    emit(NewestLoading());
   final res =  await homeRepo.fetchFeaturedBooks();
   res.fold((fauiler)
       {
         emit(NewestFauiler(errorMsg: fauiler.errMessage));
       }, (success)
   {
     emit(NewestSuccess(books: success));

   });

  }
}
