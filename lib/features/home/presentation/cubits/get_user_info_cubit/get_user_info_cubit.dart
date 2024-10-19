import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/models/auth_model/user_info_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  final HomeRepo homeRepo;
  GetUserInfoCubit({required this.homeRepo}) : super(GetUserInfoInitial());

  void getUserInfo() async {
    emit(GetUserInfoLoading());
    var result = await homeRepo.getUserInfo();
    result.fold(
        (failure) =>
            emit(GetUserInfoFailure(errorMessage: failure.errorMessage)),
        (userInfo) => emit(GetUserInfoSuccess(user: userInfo)));
  }
}
