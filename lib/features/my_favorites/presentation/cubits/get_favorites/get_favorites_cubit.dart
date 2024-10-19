import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/my_favorites/data/repos/favorites_repo.dart';
import 'package:meta/meta.dart';

part 'get_favorites_state.dart';

class GetFavoritesProductsCubit extends Cubit<GetFavoritesProductsState> {
  final MyFavoritesRepo favoritesRepo;
  GetFavoritesProductsCubit({required this.favoritesRepo})
      : super(GetFavoritesProductsInitial());

  getMyFavoritesProducts() async {
    emit(GetFavoritesProductsLoading());
    var results = await favoritesRepo.getFavorites();
    results.fold(
      (failure) =>
          emit(GetFavoritesProductsFail(errorMessage: failure.errorMessage)),
      (products) => emit(GetFavoritesProductsSuccess(products: products)),
    );
  }
}
