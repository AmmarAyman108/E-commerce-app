part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final AuthModel authModel;

  LoginSuccessState({required this.authModel});
}

class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final AuthModel authModel;

  RegisterSuccessState({required this.authModel});
}

class RegisterFailureState extends AuthState {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}

class UploadImageLoadingState extends AuthState {}

class UploadImageSuccessState extends AuthState {
  final File image;
  UploadImageSuccessState({required this.image});
}

class UploadImageFailureState extends AuthState {
  final String defaultImage = "assets/images/xm.jpg";
  UploadImageFailureState();
}
