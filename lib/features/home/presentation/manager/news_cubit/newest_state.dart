part of 'newest_cubit.dart';

@immutable
sealed class NewestState {}

final class NewestInitial extends NewestState {}
final class NewestLoading extends NewestState {}
final class NewestSuccess extends NewestState {
  final List<BookModel> books ;

  NewestSuccess({required this.books});

}
final class NewestFauiler extends NewestState {
  final String errorMsg;

  NewestFauiler({required this.errorMsg});
}
