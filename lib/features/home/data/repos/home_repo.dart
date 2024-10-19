import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:ecommerce_app/core/utils/models/auth_model/user_info_model.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/data/data_sources/home_data_source.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserInfoModel>> getUserInfo();
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductDetails({required String id});
  Future<Either<Failure, List<ProductModel>>> getSearchedProduct(
      {required String searchedText});
}

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl({required this.homeDataSource});
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      List<ProductModel> products = await homeDataSource.getProducts();
      return Right(products);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo() async {
    try {
      UserInfoModel userInfoModel = await homeDataSource.getUserInfo();
      return Right(userInfoModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(
      {required String id}) async {
    try {
      ProductModel productModel =
          await homeDataSource.getProductDetails(id: id);
      return Right(productModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getSearchedProduct(
      {required String searchedText}) async {
    try {
      List<ProductModel> searchedProducts =
          await homeDataSource.getSearchedProduct(searchedText: searchedText);
      return Right(searchedProducts);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
