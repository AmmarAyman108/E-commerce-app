import 'package:ecommerce_app/core/utils/widgets/const_size_box.dart';
import 'package:ecommerce_app/core/utils/widgets/error_widget.dart';
import 'package:ecommerce_app/features/categories/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:ecommerce_app/features/categories/presentation/views/widgets/categories_list.dart';
import 'package:ecommerce_app/features/categories/presentation/views/widgets/categories_app_bar.dart';
import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoriesAppBar()),
            SliverToBoxAdapter(
              child: ConstSizeBox(
                height: 20,
              ),
            ),
            BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
              builder: (context, state) {
                if (state is GetCategoriesSuccess) {
                  return CategoriesList(
                    categories: state.categories,
                  );
                } else if (state is GetCategoriesFail) {
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
            )
          ],
        ),
      ),
    );
  }
}
