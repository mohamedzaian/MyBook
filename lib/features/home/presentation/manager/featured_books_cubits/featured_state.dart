part of 'featured_cubit.dart';

@immutable
sealed class FeaturedState {}

final class FeaturedInitial extends FeaturedState {}
final class FeaturedLoading extends FeaturedState {}
final class FeaturedSuccess extends FeaturedState {
  final List<BookModel>books ;

  FeaturedSuccess({required this.books});
}
final class FeaturedFauleir extends FeaturedState {
  final String errorMessage;

  FeaturedFauleir({required this.errorMessage});
}
