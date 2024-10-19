part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserInfoModel user;

  GetUserInfoSuccess({required this.user});
}

final class GetUserInfoFailure extends GetUserInfoState {
  final String errorMessage;

  GetUserInfoFailure({required this.errorMessage});
}
