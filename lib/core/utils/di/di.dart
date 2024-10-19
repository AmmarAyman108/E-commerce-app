import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/utils/constant.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce_app/features/categories/data/data_sources/categories_data_source.dart';
import 'package:ecommerce_app/features/categories/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/home/data/data_sources/home_data_source.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:ecommerce_app/features/my_favorites/data/data_sources/favorites_data_source.dart';
import 'package:ecommerce_app/features/my_favorites/data/repos/favorites_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

var git = GetIt.instance;

void setUp() {
  git.registerSingleton<DioConsumer>(DioConsumer(
      dio: Dio(), token: Hive.box(Constants.tokenBox).get(Constants.tokenKey)));

  git.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        apiConsumer: git.get<DioConsumer>(),
      ),
    ),
  );

  git.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeDataSource:
            HomeDataSourceImpl(apiConsumer: git.get<DioConsumer>())),
  );

  git.registerSingleton<CategoriesRepoImpl>(
    CategoriesRepoImpl(
      categoriesRemoteDataSource:
          CategoriesRemoteDataSourceImpl(apiConsumer: git.get<DioConsumer>())
            ..getCategories(),
    ),
  );

  git.registerSingleton<MyFavoritesRepoImpl>(
    MyFavoritesRepoImpl(
        favoritesDataSource:
            MyFavoritesDataSourceImpl(apiConsumer: git.get<DioConsumer>())),
  );
}
