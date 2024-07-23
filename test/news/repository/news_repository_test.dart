// test/news/news_repository_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/exceptions.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';
import 'package:nyt/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:nyt/features/news/domain/entities/newa_request.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';
import 'package:nyt/features/news/data/repositories/news_repository.dart';

import 'news_repository_test.mocks.dart';

@GenerateMocks([BaseNewsDataSource])
void main() {
  late NewsRepository newsRepository;
  late MockBaseNewsDataSource mockBaseNewsDataSource;

  setUp(() {
    mockBaseNewsDataSource = MockBaseNewsDataSource();
    newsRepository = NewsRepository(newsDataSource: mockBaseNewsDataSource);
  });

  final tNewsRequest = NewsRequest(category: 'technology', page: 1);
  final tNewsResponseList = [
    NewsResponse(
      title: 'Title 1',
      abstract: 'Abstract 1',
      url: 'url1',
      section: 'section1',
      byline: 'byline1',
      publishedDate: '2024-01-01',
    ),
    // Add more NewsResponse instances as needed
  ];
  const tFailure = ServerFailure(ErrorMessageModel(msg: 'Error'));

  test('should return List<NewsResponse> when data source returns successful response', () async {
    // Arrange
    when(mockBaseNewsDataSource.getNews(any))
        .thenAnswer((_) async => Right(tNewsResponseList));

    // Act
    final result = await newsRepository.getNews(tNewsRequest);

    // Assert
    expect(result, Right(tNewsResponseList));
    verify(mockBaseNewsDataSource.getNews(tNewsRequest)).called(1);
    verifyNoMoreInteractions(mockBaseNewsDataSource);
  });

  test('should return Failure when data source returns an error', () async {
    // Arrange
    when(mockBaseNewsDataSource.getNews(any))
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await newsRepository.getNews(tNewsRequest);

    // Assert
    expect(result, const Left(tFailure));
    verify(mockBaseNewsDataSource.getNews(tNewsRequest)).called(1);
    verifyNoMoreInteractions(mockBaseNewsDataSource);
  });
}
