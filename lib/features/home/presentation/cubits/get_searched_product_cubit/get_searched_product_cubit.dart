import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_searched_product_state.dart';

class GetSearchedProductCubit extends Cubit<GetSearchedProductState> {
  final TextEditingController searchController = TextEditingController();
  final HomeRepo homeRepo;
  GetSearchedProductCubit({required this.homeRepo})
      : super(GetSearchedProductInitial());

  void getSearchedProduct({required String searchedText}) async {
    emit(GetSearchedProductLoading());
    var results = await homeRepo.getSearchedProduct(searchedText: searchedText);
    results.fold((failure) {
      emit(GetSearchedProductFailure(errorMessage: failure.errorMessage));
    }, (products) {
      emit(GetSearchedProductSuccess(products: products));
    });
  }
}
