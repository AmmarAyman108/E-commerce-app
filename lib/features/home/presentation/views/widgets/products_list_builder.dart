import 'package:ecommerce_app/core/utils/widgets/error_widget.dart';
import 'package:ecommerce_app/core/utils/widgets/product_list.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_product_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListBuilder extends StatelessWidget {
  const ProductsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return ProductList(
            products: state.products,
          );
        } else if (state is GetProductsFail) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: CenterIndicator(),
          );
        }
      },
    );
  }
}
