import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/categories/data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getCategoriesDetails({required String id});
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiConsumer apiConsumer;

  CategoriesRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<CategoryModel>> getCategories() async {
    Map<String, dynamic> jsonData =
        await apiConsumer.get(endPoint: EndPoints.categories);
    List<dynamic> results = jsonData["data"]["data"];
    List<CategoryModel> categories = [];
    for (var categoryData in results) {
      categories.add(CategoryModel.fromJson(categoryData));
    }
    return categories;
  }

  @override
  Future<List<ProductModel>> getCategoriesDetails({required String id}) async {
    Map<String, dynamic> jsonData =
        await apiConsumer.get(endPoint: "${EndPoints.categories}/$id");
    List<dynamic> results = jsonData["data"]["data"];
    List<ProductModel> categories = [];
    for (var categoryData in results) {
      categories.add(ProductModel.fromJson(categoryData));
    }
    return categories;
  }
}
