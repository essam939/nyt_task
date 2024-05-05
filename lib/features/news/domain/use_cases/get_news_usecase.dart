import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/utilities/base_usecase.dart';
import 'package:nyt/features/news/domain/entities/newa_request.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';
import 'package:nyt/features/news/domain/repositories/base_news_repository.dart';


class GetNewsUseCase extends BaseUseCase<List<NewsResponse>, NewsRequest > {
  final BaseNewsRepository newsRepository;

  GetNewsUseCase(this.newsRepository);

  @override
  Future<Either<Failure, List<NewsResponse>>> execute(NewsRequest params) async {
    return await newsRepository.getNews(params);
  }
}