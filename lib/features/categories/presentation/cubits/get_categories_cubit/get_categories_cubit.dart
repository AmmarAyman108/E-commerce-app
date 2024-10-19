// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/categories/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

import 'package:ecommerce_app/features/categories/data/repos/categories_repo.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final CategoriesRepo categoriesRepo;
  GetCategoriesCubit({required this.categoriesRepo})
      : super(GetCategoriesInitial());
  getCategories() async {
    emit(GetCategoriesLoading());
    var results = await categoriesRepo.getCategories();
    results.fold(
      (failure) => emit(GetCategoriesFail(errorMessage: failure.errorMessage)),
      (categories) => emit(GetCategoriesSuccess(categories: categories)),
    );
  }
}
