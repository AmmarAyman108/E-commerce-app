import 'package:ecommerce_app/config/router/app_router.dart';
import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/config/theme/dark_theme.dart';
import 'package:ecommerce_app/config/theme/light_theme.dart';
import 'package:ecommerce_app/core/utils/constant.dart';
import 'package:ecommerce_app/core/utils/di/di.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/categories/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/categories/presentation/cubits/get_categories_details_cubit/get_categories_details_cubit.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_product_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_searched_product_cubit/get_searched_product_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:ecommerce_app/features/my_favorites/data/repos/favorites_repo.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/change_favorites/change_favorites_cubit.dart';
import 'package:ecommerce_app/features/my_favorites/presentation/cubits/get_favorites/get_favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ChangeFavoritesCubit(
                  favoritesRepo: git.get<MyFavoritesRepoImpl>())),
          BlocProvider(
            create: (context) => GetFavoritesProductsCubit(
              favoritesRepo: git.get<MyFavoritesRepoImpl>(),
            )..getMyFavoritesProducts(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(
              authRepo: git.get<AuthRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                GetUserInfoCubit(homeRepo: git.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                GetSearchedProductCubit(homeRepo: git.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => GetCategoriesDetailsCubit(
                categoriesRepo: git.get<CategoriesRepoImpl>()),
          ),
        ],
        child: BlocProvider(
          create: (context) =>
              GetProductsCubit(homeRepo: git.get<HomeRepoImpl>())
                ..getProducts(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightTheme.get(),
            themeMode: ThemeMode.light,
            darkTheme: DarkTheme.get(),
            initialRoute:
                Hive.box(Constants.tokenBox).get(Constants.tokenKey) == null
                    ? Routes.onBoarding
                    : Routes.home,
            onGenerateRoute: AppRouter.onGenerate,
          ),
        ),
      ),
    );
  }
}
