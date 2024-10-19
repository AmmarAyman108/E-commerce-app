import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce_app/features/categories/presentation/views/categories_view.dart';
import 'package:ecommerce_app/features/categories/presentation/views/widgets/categories_details.dart';
import 'package:ecommerce_app/features/my_favorites/presentation/views/widgets/my_favorites_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/search_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/my_profile_view.dart';
import 'package:ecommerce_app/features/my_cart/presentation/views/widgets/my_cart_view.dart';
import 'package:ecommerce_app/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoardingView());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case Routes.myCart:
        return MaterialPageRoute(builder: (context) => MyCartView());
      case Routes.categories:
        return MaterialPageRoute(builder: (context) => CategoriesView());
      case Routes.search:
        return MaterialPageRoute(builder: (context) => SearchView());
      case Routes.myProfile:
        return MaterialPageRoute(builder: (context) => MyProfileView());
      case Routes.favorites:
        return MaterialPageRoute(builder: (context) => MyFavoritesView());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => RegisterView());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginView());
      case Routes.categoriesDetails:
        return MaterialPageRoute(
            builder: (context) => CategoryDetailsView(
                  categoryName: settings.arguments as String,
                ));
      default:
        return _getDefaultRouter();
    }
  }

  static Route _getDefaultRouter() => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('This Route Not Found!'),
          ),
        ),
      );
}
