import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/features/news/domain/entities/newa_request.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';


abstract class BaseNewsRepository {
  Future<Either<Failure,List<NewsResponse>>> getNews( NewsRequest newsRequest);
}