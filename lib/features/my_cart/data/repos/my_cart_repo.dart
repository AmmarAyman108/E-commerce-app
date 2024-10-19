import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/server_error.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/my_cart/data/data_sources/my_cart_data_source.dart';
import 'package:ecommerce_app/features/my_cart/data/models/operation_cart_response.dart';

abstract class MyCartRepo {
  Future<Either<Failure, List<ProductModel>>> getMyCart();
  Future<Either<Failure, OperationCartResponse>> addInMyCart(
      {required String id});
  Future<Either<Failure, OperationCartResponse>> removeFromMyCart(
      {required String id});
}

class FavoritesRepoImpl extends MyCartRepo {
  final MyCartRemoteDataSource myCartRemoteDataSource;

  FavoritesRepoImpl({required this.myCartRemoteDataSource});
  @override
  Future<Either<Failure, OperationCartResponse>> addInMyCart(
      {required String id}) async {
    try {
      OperationCartResponse cartResponse =
          await myCartRemoteDataSource.addToCart(id: id);
      return right(cartResponse);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getMyCart() async {
    try {
      List<ProductModel> products = await myCartRemoteDataSource.getMyCart();
      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OperationCartResponse>> removeFromMyCart(
      {required String id}) async {
    try {
      OperationCartResponse cartResponse =
          await myCartRemoteDataSource.removeFromCart(id: id);
      return right(cartResponse);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
