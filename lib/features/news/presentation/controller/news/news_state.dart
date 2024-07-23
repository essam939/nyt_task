part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}
class NewsPagination extends NewsState {}

class NewsLoaded extends NewsState {
  NewsLoaded({required this.newsResponse});
  final List<NewsResponse> newsResponse;
  @override
  List<Object> get props => [];
}

class NewsError extends NewsState {

  NewsError({required this.errorMessage});
  final ErrorMessageModel errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
