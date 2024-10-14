import 'package:app_books/core/utils/lacator_service.dart';
import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/data/repos/home_repo.dart';
import 'package:app_books/features/home/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit(this.homeRepo) : super(FeaturedInitial());
  final HomeRepo homeRepo;
  void getFeatured()async
  {
    emit(FeaturedLoading());
    final res = await getIt.get<HomeRepoImpl>().fetchFeaturedBooks();
    res.fold((failuer)
        {
         emit(FeaturedFauleir(errorMessage: failuer.errMessage));
        }, (books)
    {
      emit(FeaturedSuccess(books: books));
    });
  }
}
