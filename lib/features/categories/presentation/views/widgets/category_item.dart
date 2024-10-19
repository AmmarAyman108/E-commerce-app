// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/features/categories/presentation/cubits/get_categories_details_cubit/get_categories_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/features/categories/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.categoriesDetails,
            arguments: category.name);
        BlocProvider.of<GetCategoriesDetailsCubit>(context)
            .getCategoriesDetails(id: category.id.toString());
      },
      child: Container(
        margin:
            EdgeInsetsDirectional.symmetric(vertical: 5.r, horizontal: 20.r),
        height: 150.h,
        width: MediaQuery.sizeOf(context).width * .6,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  offset: Offset(4, 7),
                  blurRadius: 5),
            ],
            image: DecorationImage(
                image: NetworkImage(
                  category.image!,
                ),
                fit: BoxFit.fitWidth),
            // border: Border.all(
            //     color: const Color.fromARGB(255, 163, 163, 163), width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          category.name!,
          style: TextStyle(
              fontSize: 20.sp,
              color: const Color.fromARGB(255, 34, 0, 66),
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
