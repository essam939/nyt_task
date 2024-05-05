import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';
import 'package:nyt/core/utilities/db_helper.dart';
import 'package:nyt/features/news/domain/entities/newa_request.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';
import 'package:nyt/features/news/domain/use_cases/get_news_usecase.dart';


part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsUseCase getNewsUseCase;
  List<NewsResponse> newsList = [];
  int page = 1;

  NewsCubit({required this.getNewsUseCase}) : super(NewsInitial());

  Future<void> getCategories(NewsRequest newsRequest) async {
    if (newsRequest.page == 1) {
      emit(NewsLoading());
    } else {
      emit(NewsPagination());
    }

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // If no internet connection, load data from SQLite
      List<NewsResponse> offlineNewsList = await DBHelper.dbHelper.fetchAllRecords();
      if (offlineNewsList.isNotEmpty) {
        newsList=offlineNewsList;
        emit(NewsLoaded(newsResponse: offlineNewsList));
      } else {
        emit(NewsError(errorMessage:const ErrorMessageModel(msg: "No internet connection. No data available offline.")));
      }
      return;
    }

    final result = await getNewsUseCase.execute(newsRequest);
    result.fold(
          (failure) => emit(NewsError(errorMessage: failure.errorMessageModel)),
          (response) {
        if (newsRequest.page == 1 && response.isNotEmpty) {
          newsList = response;
        } else {
          newsList.addAll(response);
        }
        // Save data in database
        DBHelper.dbHelper.clearRecords();
        DBHelper.dbHelper.insertRecord(newsResponseList: newsList);
        emit(NewsLoaded(newsResponse: newsList));
      },
    );
  }
}
