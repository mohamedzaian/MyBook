part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<BookModel> list;

  SearchSuccess({required this.list});
}
final class SearchFauiler extends SearchState {
  final String errorMessage;

  SearchFauiler({required this.errorMessage});
}
