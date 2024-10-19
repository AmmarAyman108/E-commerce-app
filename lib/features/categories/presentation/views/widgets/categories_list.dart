// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_app/features/categories/data/models/category_model.dart';
import 'package:ecommerce_app/features/categories/presentation/views/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(top: 13),
        child: CategoryItem(
          category: categories[index],
        ),
      ),
    );
  }
}
