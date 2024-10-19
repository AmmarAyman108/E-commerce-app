
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/utils/models/auth_model/user_info_model.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';

abstract class HomeDataSource {
  Future<List<ProductModel>> getProducts();
  Future<UserInfoModel> getUserInfo();
  Future<ProductModel> getProductDetails({required String id});
  Future<List<ProductModel>> getSearchedProduct({required String searchedText});
}

class HomeDataSourceImpl extends HomeDataSource {
  final ApiConsumer apiConsumer;

  HomeDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<ProductModel>> getProducts() async {
    Map<String, dynamic> jsonData =
        await apiConsumer.get(endPoint: EndPoints.home);
    List<dynamic> results = jsonData["data"]["products"];
    List<ProductModel> products = [];
    for (var productData in results) {
      products.add(ProductModel.fromJson(productData));
    }
    return products;
  }

  @override
  Future<UserInfoModel> getUserInfo() async {
    Map<String, dynamic> jsonData =
        await apiConsumer.get(endPoint: EndPoints.profile);
    return UserInfoModel.fromJson(jsonData["data"]);
  }

  @override
  Future<ProductModel> getProductDetails({required String id}) async {
    Map<String, dynamic> jsonData = await apiConsumer.get(
      endPoint: "${EndPoints.products}/$id",
    );
    return ProductModel.fromJson(jsonData["data"]);
  }

  @override
  Future<List<ProductModel>> getSearchedProduct(
      {required String searchedText}) async {
    Map<String, dynamic> jsonData = await apiConsumer
        .post(endPoint: EndPoints.search, bodyData: {"text": searchedText});
    List<dynamic> results = jsonData["data"]["data"];
    List<ProductModel> searchedProducts = [];
    for (var productData in results) {
      searchedProducts.add(ProductModel.fromJson(productData));
    }
    return searchedProducts;
  }
}
