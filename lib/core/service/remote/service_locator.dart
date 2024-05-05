import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nyt/core/service/simple_secure_user_data.dart';
import 'package:nyt/core/service/simple_user_data.dart';
import 'package:nyt/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:nyt/features/authentication/data/repositories/authantication_reposiory.dart';
import 'package:nyt/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:nyt/features/authentication/presentation/controller/login_cubit.dart';
import 'package:nyt/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:nyt/features/news/data/repositories/news_repository.dart';
import 'package:nyt/features/news/domain/repositories/base_news_repository.dart';
import 'package:nyt/features/news/domain/use_cases/get_news_usecase.dart';
import 'package:nyt/features/news/presentation/controller/categories/categories_cubit.dart';
import 'package:nyt/features/news/presentation/controller/news/news_cubit.dart';


import '../../../features/authentication/domain/repositories/base_authentication_repository.dart';
import 'api_consumer.dart';
import 'dio_consumer.dart';

mixin ServiceLocator {
  static final instance = GetIt.instance;
  static void init() {
    // bloc
    instance.registerLazySingleton(() => NewsCubit(getNewsUseCase: instance()));
    instance.registerLazySingleton(() => SelectedCategoryCubit());
    instance.registerLazySingleton(() => LoginCubit());


    // use cases
    instance.registerLazySingleton(() => GetNewsUseCase(instance()));
    instance.registerLazySingleton(() => LoginUseCase(instance()));

// repository
    instance.registerLazySingleton<BaseNewsRepository>(
      () => NewsRepository(newsDataSource: instance()),
    );
    instance.registerLazySingleton<BaseAuthenticationRepository>(
          () => AuthenticationRepository(
        authenticationDataSource: instance(),
      ),
    );
    // data source
    instance.registerLazySingleton<BaseNewsDataSource>(
          () => NewsDataSource(
        instance(),
      ),
    );
    instance.registerLazySingleton<BaseAuthenticationDataSource>(
          () => AuthenticationDataSource(
        instance(),
      ),
    );

    instance.registerLazySingleton(() => const SimpleLocalData());
    instance.registerLazySingleton(() => SimpleSecureData(instance()));
    instance.registerLazySingleton<DioConsumer>(() => ApiConsumer());
    instance.registerLazySingleton(() => const FlutterSecureStorage());
  }
}
