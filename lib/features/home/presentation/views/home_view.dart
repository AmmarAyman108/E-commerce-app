import 'package:ecommerce_app/core/utils/di/di.dart';
import 'package:ecommerce_app/features/categories/data/repos/categories_repo.dart';
import 'package:ecommerce_app/features/categories/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:ecommerce_app/features/categories/presentation/views/categories_view.dart';
import 'package:ecommerce_app/features/my_favorites/presentation/views/widgets/my_favorites_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:ecommerce_app/features/my_cart/presentation/views/widgets/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeViewBody(),
    BlocProvider(
      create: (context) =>
          GetCategoriesCubit(categoriesRepo: git.get<CategoriesRepoImpl>())
            ..getCategories(),
      child: const CategoriesView(),
    ),
    const MyCartView(),
    const MyFavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: getBottomNavItems),
    );
  }

  List<BottomNavigationBarItem> get getBottomNavItems {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined), label: "Category"),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: "My Cart"),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border), label: "My Favorite"),
    ];
  }
}
