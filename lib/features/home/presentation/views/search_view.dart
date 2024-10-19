import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:ecommerce_app/core/utils/widgets/const_size_box.dart';
import 'package:ecommerce_app/core/utils/widgets/error_widget.dart';
import 'package:ecommerce_app/core/utils/widgets/product_list.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_searched_product_cubit/get_searched_product_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/search_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var getSearchedProductCubit =
        BlocProvider.of<GetSearchedProductCubit>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchViewAppBar()),
            SliverToBoxAdapter(
              child: ConstSizeBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
                child: CustomTextField(
              controller: getSearchedProductCubit.searchController,
              onChanged: (p0) async {
                getSearchedProductCubit.getSearchedProduct(
                    searchedText:
                        BlocProvider.of<GetSearchedProductCubit>(context)
                            .searchController
                            .text);
              },
            )),
            SearchedProductListBuilder()
          ],
        ),
      ),
    );
  }
}

class SearchedProductListBuilder extends StatelessWidget {
  const SearchedProductListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchedProductCubit, GetSearchedProductState>(
        builder: (context, state) {
      if (state is GetSearchedProductSuccess) {
        return ProductList(
          products: state.products,
        );
      } else if (state is GetSearchedProductFailure) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: CustomErrorWidget(
            errorMessage: state.errorMessage,
          ),
        );
      } else if (state is GetSearchedProductInitial) {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Search For Product')),
        );
      } else {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: CenterIndicator(),
        );
      }
    });
  }
}
