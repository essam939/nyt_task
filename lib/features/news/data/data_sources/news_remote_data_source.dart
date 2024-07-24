import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/service/remote/dio_consumer.dart';
import 'package:nyt/features/news/domain/entities/newa_request.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';


part 'endpoints.dart';
abstract class BaseNewsDataSource {
  Future<Either<Failure, List<NewsResponse>>> getNews(NewsRequest newsRequest);
}
class NewsDataSource extends BaseNewsDataSource {
  NewsDataSource(this._dio);
  final DioConsumer _dio;
  @override
  Future<Either<Failure, List<NewsResponse>>> getNews(NewsRequest newsRequest) async {
    final responseEither = await _dio.get(
      _NewsEndpoints.newsByCategory(newsRequest.category),
    );
    return responseEither.fold(
          (failure) => Left(failure),
          (response) {
        final categoriesListJson = response["results"] as List<dynamic>;
        final newsList = categoriesListJson
            .map(
              (categoriesJson) => NewsResponse.fromJson(
              categoriesJson as Map<String, dynamic>),
        )
            .toList();
        return Right(newsList);
      },
    );
  }

}