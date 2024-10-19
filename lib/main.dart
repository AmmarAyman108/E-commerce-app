import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/utils/constant.dart';
import 'package:ecommerce_app/core/utils/di/di.dart';
import 'package:ecommerce_app/ecommerce_app.dart';
import 'package:ecommerce_app/features/my_favorites/data/data_sources/favorites_data_source.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Constants.tokenBox);
  await Hive.openBox(Constants.userBox);

  setUp();
  await MyFavoritesDataSourceImpl(apiConsumer: git.get<DioConsumer>())
    ..getFavorites();
  // Bloc.observer=;
  runApp(const EcommerceApp());
}
