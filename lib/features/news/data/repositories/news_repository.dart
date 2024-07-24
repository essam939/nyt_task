import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/protobuf/news_request/news.pb.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:nyt/features/news/data/data_sources/news_remote_data_source.dart';


import '../../domain/repositories/base_news_repository.dart';

class NewsRepository extends BaseNewsRepository {

  NewsRepository({required this.newsDataSource});
  final BaseNewsDataSource newsDataSource;

  @override
  Future<Either<Failure, List<NewsResponse>>> getNews(NewsRequest newsRequest) async {
    return await newsDataSource.getNews(newsRequest);
  }
}
