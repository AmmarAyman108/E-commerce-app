part of 'get_favorites_cubit.dart';

@immutable
sealed class GetFavoritesProductsState {}

final class GetFavoritesProductsInitial extends GetFavoritesProductsState {}

final class GetFavoritesProductsLoading extends GetFavoritesProductsState {}

final class GetFavoritesProductsSuccess extends GetFavoritesProductsState {
  final List<ProductModel> products;

  GetFavoritesProductsSuccess({required this.products});
}

final class GetFavoritesProductsFail extends GetFavoritesProductsState {
  final String errorMessage;

  GetFavoritesProductsFail({required this.errorMessage});
}
