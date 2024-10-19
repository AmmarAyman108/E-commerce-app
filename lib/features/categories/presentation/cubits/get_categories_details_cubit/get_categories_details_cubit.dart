import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/categories/data/repos/categories_repo.dart';
import 'package:meta/meta.dart';

part 'get_categories_details_state.dart';

class GetCategoriesDetailsCubit extends Cubit<GetCategoriesDetailsState> {
  final CategoriesRepo categoriesRepo;
  GetCategoriesDetailsCubit({required this.categoriesRepo})
      : super(GetCategoriesDetailsInitial());
  getCategoriesDetails({required String id}) async {
    emit(GetCategoriesDetailsLoading());
    var results = await categoriesRepo.getCategoriesDetails(id: id);

    results.fold(
      (failure) =>
          emit(GetCategoriesDetailsFail(errorMessage: failure.errorMessage)),
      (categoryProducts) => emit(
          GetCategoriesDetailsSuccess(categoriesProduct: categoryProducts)),
    );
  }
}
