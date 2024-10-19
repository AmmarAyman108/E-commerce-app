import 'package:ecommerce_app/core/utils/widgets/const_size_box.dart';
import 'package:ecommerce_app/core/utils/widgets/error_widget.dart';
import 'package:ecommerce_app/core/utils/widgets/product_list.dart';
import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:ecommerce_app/features/my_favorites/presentation/cubits/get_favorites/get_favorites_cubit.dart';
import 'package:ecommerce_app/features/my_favorites/presentation/views/widgets/my_favorites_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MyFavoritesAppBar()),
            SliverToBoxAdapter(
              child: ConstSizeBox(
                height: 20,
              ),
            ),
            BlocBuilder<GetFavoritesProductsCubit, GetFavoritesProductsState>(
              builder: (context, state) {
                if (state is GetFavoritesProductsSuccess) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: CustomErrorWidget(
                      errorMessage: state.products[0].name!,
                    ),
                  );
                } else if (state is GetFavoritesProductsFail) {
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
