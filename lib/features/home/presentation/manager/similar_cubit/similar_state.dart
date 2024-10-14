part of 'similar_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitial extends SimilarState {}
final class SimilarLoading extends SimilarState {}
final class SimilarSuccess extends SimilarState {
  final List<BookModel>books ;

  SimilarSuccess({required this.books});
}
final class SimilarFauleir extends SimilarState {
  final String errorMessage;

  SimilarFauleir({required this.errorMessage});
}
