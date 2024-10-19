import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/categories/data/data_sources/categories_data_source.dart';
import 'package:ecommerce_app/features/categories/data/models/category_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> getCategoriesDetails(
      {required String id});
}

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepoImpl({required this.categoriesRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      List<CategoryModel> categories =
          await categoriesRemoteDataSource.getCategories();
      return right(categories);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCategoriesDetails(
      {required String id}) async {
    try {
      List<ProductModel> categories =
          await categoriesRemoteDataSource.getCategoriesDetails(id: id);
      return right(categories);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
