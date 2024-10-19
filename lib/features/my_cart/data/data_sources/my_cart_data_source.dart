import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/my_cart/data/models/operation_cart_response.dart';

abstract class MyCartRemoteDataSource {
  Future<List<ProductModel>> getMyCart();
  Future<OperationCartResponse> addToCart({required String id});
  Future<OperationCartResponse> removeFromCart({required String id});
}

class MyCartRemoteDataSourceImpl implements MyCartRemoteDataSource {
  final ApiConsumer apiConsumer;

  MyCartRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<OperationCartResponse> removeFromCart({required String id}) async {
    Map<String, dynamic> jsonData = await apiConsumer
        .post(endPoint: EndPoints.carts, isFormData: true, bodyData: {
      'product_id': id,
    });
    return OperationCartResponse.fromJson(jsonData);
  }

  @override
  Future<List<ProductModel>> getMyCart() async {
    Map<String, dynamic> jsonData =
        await apiConsumer.get(endPoint: EndPoints.carts);
    List<dynamic> results = jsonData["data"]["cart_items"];
    List<ProductModel> products = [];
    for (var item in results) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  @override
  Future<OperationCartResponse> addToCart({required String id}) async {
    Map<String, dynamic> jsonData = await apiConsumer
        .post(endPoint: EndPoints.carts, isFormData: true, bodyData: {
      'product_id': id,
    });
    return OperationCartResponse.fromJson(jsonData);
  }
}
