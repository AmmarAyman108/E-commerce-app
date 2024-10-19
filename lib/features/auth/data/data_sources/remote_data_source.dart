import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/functions/save_data_locally.dart';
import 'package:ecommerce_app/core/utils/constant.dart';
import 'package:ecommerce_app/core/utils/models/auth_model/auth_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({
    required String email,
    required String password,
  });
  Future<AuthModel> register(
    context, {
    required String email,
    required String password,
    required String name,
    required String phone,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    Map<String, dynamic> jsonData = await apiConsumer.post(
        endPoint: EndPoints.login,
        bodyData: {"email": email, "password": password},
        isFormData: true);
    AuthModel authModel = AuthModel.fromJson(jsonData);
    saveDataLocally(key: Constants.tokenKey, value: authModel.data!.token!);
    await saveUserInfo(authModel);
    return authModel;
  }

  Future<void> saveUserInfo(AuthModel authModel) async {
    await Hive.box(Constants.userBox).putAll({
      'name': authModel.data!.name,
      'image': authModel.data!.name,
    });
  }

  @override
  Future<AuthModel> register(
    context, {
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    Map<String, dynamic> jsonData = await apiConsumer.post(
        endPoint: EndPoints.register,
        bodyData: {
          "email": email,
          "password": password,
          "name": name,
          "phone": phone,
          "image": null
        },
        isFormData: true);
    AuthModel authModel = AuthModel.fromJson(jsonData);
    saveDataLocally(key: Constants.tokenKey, value: authModel.data!.token!);
    await saveUserInfo(authModel);

    return authModel;
  }
}
