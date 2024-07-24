import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/protobuf/news_request/news.pb.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';



abstract class BaseNewsRepository {
  Future<Either<Failure,List<NewsResponse>>> getNews( NewsRequest newsRequest);
}