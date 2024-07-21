// test/news/news_cubit_test.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/exceptions.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';
import 'package:nyt/core/utilities/db_helper.dart';
import 'package:nyt/features/news/domain/entities/newa_request.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';
import 'package:nyt/features/news/domain/use_cases/get_news_usecase.dart';
import 'package:nyt/features/news/presentation/controller/news/news_cubit.dart';
import 'news_cubit_test.mocks.dart';

@GenerateMocks([GetNewsUseCase, Connectivity])  // Include Connectivity here
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NewsCubit newsCubit;
  late MockGetNewsUseCase mockGetNewsUseCase;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockGetNewsUseCase = MockGetNewsUseCase();
    mockConnectivity = MockConnectivity();
    newsCubit = NewsCubit(getNewsUseCase: mockGetNewsUseCase);
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
  final tFailure = ServerFailure(ErrorMessageModel(msg: 'Error'));

  test('initial state should be NewsInitial', () {
    expect(newsCubit.state, equals(NewsInitial()));
  });

  blocTest<NewsCubit, NewsState>(
    'should emit NewsLoading and then NewsLoaded when data is fetched successfully',
    build: () {
      when(mockGetNewsUseCase.execute(any))
          .thenAnswer((_) async => Right(tNewsResponseList));
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.mobile]);
      return newsCubit;
    },
    act: (cubit) => cubit.getCategories(tNewsRequest),
    expect: () => [
      NewsLoading(),
      NewsLoaded(newsResponse: tNewsResponseList),
    ],
    verify: (_) {
      verify(mockGetNewsUseCase.execute(tNewsRequest)).called(1);
    },
  );

  blocTest<NewsCubit, NewsState>(
    'should emit NewsError when fetching data fails',
    build: () {
      when(mockGetNewsUseCase.execute(any))
          .thenAnswer((_) async => Left(tFailure));
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.mobile]);
      return newsCubit;
    },
    act: (cubit) => cubit.getCategories(tNewsRequest),
    expect: () => [
      NewsLoading(),
      NewsError(errorMessage: tFailure.errorMessageModel),
    ],
    verify: (_) {
      verify(mockGetNewsUseCase.execute(tNewsRequest)).called(1);
    },
  );

  blocTest<NewsCubit, NewsState>(
    'should emit NewsError when there is no internet connection and no offline data',
    build: () {
      when(mockGetNewsUseCase.execute(any))
          .thenAnswer((_) async => Left(tFailure));
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.none]);
      // Mocking DBHelper calls
      when(DBHelper.dbHelper.fetchAllRecords())
          .thenAnswer((_) async => []);
      return newsCubit;
    },
    act: (cubit) => cubit.getCategories(tNewsRequest),
    expect: () => [
      NewsLoading(),
      NewsError(errorMessage: ErrorMessageModel(msg: "No internet connection. No data available offline.")),
    ],
    verify: (_) {
      verify(DBHelper.dbHelper.fetchAllRecords()).called(1);
    },
  );
}