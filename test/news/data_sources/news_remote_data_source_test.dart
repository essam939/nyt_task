import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/exceptions.dart';
import 'package:nyt/core/protobuf/news_request/news.pb.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:nyt/core/service/remote/dio_consumer.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';
import 'package:nyt/features/news/data/data_sources/news_remote_data_source.dart';

import 'news_remote_data_source_test.mocks.dart';

@GenerateMocks([DioConsumer])
void main() {
  late NewsDataSource newsDataSource;
  late MockDioConsumer mockDioConsumer;

  setUp(() {
    mockDioConsumer = MockDioConsumer();
    newsDataSource = NewsDataSource(mockDioConsumer);
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
  ];

  test('should return List<NewsResponse> when DioConsumer returns valid data', () async {
    // Arrange
    final responseJson = {
      "results": tNewsResponseList.map((e) => {
        'title': e.title,
        'abstract': e.abstract,
        'url': e.url,
        'section': e.section,
        'byline': e.byline,
        'publishedDate': e.publishedDate,
      }).toList()
    };
    when(mockDioConsumer.get(any))
        .thenAnswer((_) async => Right(responseJson)); // Mock returning the correct type

    // Act
    final result = await newsDataSource.getNews(tNewsRequest);

    // Assert
    expect(result, Right(tNewsResponseList)); // Adjusted to match the type
    verify(mockDioConsumer.get(any)).called(1);
    verifyNoMoreInteractions(mockDioConsumer);
  });

  test('should return Failure when DioConsumer returns an error', () async {
    // Arrange
    const failure = ServerFailure(ErrorMessageModel(msg: 'Error'));
    when(mockDioConsumer.get(any))
        .thenAnswer((_) async => const Left(failure)); // Mock returning the correct type

    // Act
    final result = await newsDataSource.getNews(tNewsRequest);

    // Assert
    expect(result, const Left(failure)); // Adjusted to match the type
    verify(mockDioConsumer.get(any)).called(1);
    verifyNoMoreInteractions(mockDioConsumer);
  });
}