import 'package:app_books/features/home/data/model/book_model.dart';
import 'package:app_books/features/home/data/repos/search_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
   void getSearchItems () async
  {

    try {
      emit(SearchLoading());
         final list = await SearchRepo().getBooks();
      emit(SearchSuccess(list:list ));
    } on Exception catch (e) {
      emit(SearchFauiler(errorMessage: e.toString()));
    }

  }
}
