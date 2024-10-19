part of 'get_categories_details_cubit.dart';

@immutable
sealed class GetCategoriesDetailsState {}

final class GetCategoriesDetailsInitial extends GetCategoriesDetailsState {}

final class GetCategoriesDetailsLoading extends GetCategoriesDetailsState {}

final class GetCategoriesDetailsSuccess extends GetCategoriesDetailsState {
  final List<ProductModel> categoriesProduct;

  GetCategoriesDetailsSuccess({required this.categoriesProduct});
}

final class GetCategoriesDetailsFail extends GetCategoriesDetailsState {
  final String errorMessage;

  GetCategoriesDetailsFail({required this.errorMessage});
}
