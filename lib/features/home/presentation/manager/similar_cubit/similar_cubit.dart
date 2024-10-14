import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/lacator_service.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../featured_books_cubits/featured_cubit.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeRepo) : super(SimilarInitial());
  final HomeRepo homeRepo;
  void getSimilar()async
  {
    emit(SimilarLoading());
    final res = await getIt.get<HomeRepoImpl>().fetchSimilarBooks(category: 'sadas');
    res.fold((failuer)
    {
      emit(SimilarFauleir(errorMessage: failuer.errMessage));
    }, (books)
    {
      emit(SimilarSuccess(books: books));
    });
  }
}
