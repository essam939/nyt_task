import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/protobuf/news_request/news.pb.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:nyt/core/service/remote/dio_consumer.dart';



part 'endpoints.dart';
abstract class BaseNewsDataSource {
  Future<Either<Failure, List<NewsResponse>>> getNews(NewsRequest newsRequest);
}

class NewsDataSource extends BaseNewsDataSource {
  NewsDataSource(this._dio);
  final DioConsumer _dio;
  @override
  Future<Either<Failure, List<NewsResponse>>> getNews(NewsRequest newsRequest) async {
    final url = _NewsEndpoints.newsByCategory(newsRequest.category);
      final response = await _dio.get(url);
    return  response.fold((failure) =>Left(failure), (response) {
        final categoriesListJson = response["results"] as List<dynamic>;
        return Right(
          categoriesListJson.map((json) {
            return NewsResponse()
              ..section = json['section'] ?? 'N/A'
              ..title = json['title'] ?? 'N/A'
              ..url = json['url'] ?? ''
              ..abstract = json['abstract'] ?? 'N/A'
              ..byline = json['byline'] ?? 'N/A'
              ..publishedDate = json['published_date'] ?? 'N/A';
          }).toList(),
        );
      });

  }
}
