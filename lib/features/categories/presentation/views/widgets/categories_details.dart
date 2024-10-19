// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:ecommerce_app/core/utils/widgets/error_widget.dart';
import 'package:ecommerce_app/core/utils/widgets/product_list.dart';
import 'package:ecommerce_app/features/categories/presentation/cubits/get_categories_details_cubit/get_categories_details_cubit.dart';
import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsView extends StatelessWidget {
  final String categoryName;

  const CategoryDetailsView({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                SizedBox(width: 20),
                Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            )),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            CategoriesProductListBuilder()
          ],
        ),
      ),
    );
  }
}

class CategoriesProductListBuilder extends StatelessWidget {
  const CategoriesProductListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<GetCategoriesDetailsCubit, GetCategoriesDetailsState>(
        builder: (context, state) {
          if (state is GetCategoriesDetailsSuccess) {
            return ProductList(
              products: state.categoriesProduct,
            );
          } else if (state is GetCategoriesDetailsFail) {
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
    });
  }
}
