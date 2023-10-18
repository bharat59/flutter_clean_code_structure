import 'package:dio/dio.dart';
import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/local/app_database.dart';
import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'data/repositories/database_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/database_repository.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

import 'utils/constants/string.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  //Database
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>())
  );

  //Dio api client
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<NewsApiService>()),
  );
}
