import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/protobuf/news_request/news.pb.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:nyt/core/utilities/base_usecase.dart';

import 'package:nyt/features/news/domain/repositories/base_news_repository.dart';


class GetNewsUseCase extends BaseUseCase<List<NewsResponse>, NewsRequest > {

  GetNewsUseCase(this.newsRepository);
  final BaseNewsRepository newsRepository;

  @override
  Future<Either<Failure, List<NewsResponse>>> execute(NewsRequest params) async {
    return await newsRepository.getNews(params);
  }
}