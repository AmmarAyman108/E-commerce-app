import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/models/auth_model/auth_model.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AutovalidateMode loginAutovalidateModeController = AutovalidateMode.disabled;
  final GlobalKey<FormState> loginFormKeyController = GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  AutovalidateMode registerAutovalidateModeController =
      AutovalidateMode.disabled;
  final GlobalKey<FormState> registerFormKeyController = GlobalKey<FormState>();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerPhoneController = TextEditingController();
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  Future login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailureState(errorMessage: failure.errorMessage)),
      (authModel) => emit(
        LoginSuccessState(authModel: authModel),
      ),
    );
  }

  Future register(
    context, {
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    print("===================>$selectedImage");
    var result = await authRepo.register(
      context,
      email: email,
      password: password,
      name: name,
      phone: phone,
    );

    result.fold(
      (failure) =>
          emit(RegisterFailureState(errorMessage: failure.errorMessage)),
      (authModel) => emit(
        RegisterSuccessState(authModel: authModel),
      ),
    );
  }

  Future upLoadImage() async {
    emit(UploadImageLoadingState());
    try {
      File image = selectedImage ?? await selectImage();
      String fileName = image.path.split('/').last;
      await MultipartFile.fromFile(image.path, filename: fileName);
      emit(UploadImageSuccessState(image: image));
    } catch (e) {
      emit(UploadImageFailureState());
    }
  }

  File? selectedImage;

  Future selectImage() async {
    emit(UploadImageLoadingState());

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        selectedImage = File(image.path);
        emit(UploadImageSuccessState(image: selectedImage!));

        return selectedImage;
      } else {
        emit(UploadImageFailureState());
      }
    } catch (e) {
      emit(UploadImageFailureState());
    }
  }
}
