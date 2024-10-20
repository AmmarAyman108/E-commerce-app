// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_product_cubit/get_products_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/change_favorites/change_favorites_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/utils/models/product_model/product_model.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductModel product;
  ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var addFavoritesCubit = BlocProvider.of<ChangeFavoritesCubit>(context);
    return Container(
      clipBehavior: Clip.none,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: AspectRatio(
                    aspectRatio: 1.8 / 1.3,
                    child: CachedNetworkImage(
                      imageUrl: product.image!,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 7,
                top: 7,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        await addFavoritesCubit.changeFavorite(
                            context, product.id!);
                      },
                      icon: BlocBuilder<ChangeFavoritesCubit,
                          ChangeFavoritesState>(
                        builder: (context, state) {
                          return BlocProvider.of<GetProductsCubit>(context)
                                  .favorites[product.id]!
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                );
                        },
                      )),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  height: 20,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "${product.discount}%",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 15.r),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              product.name ?? "",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(product.description ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.grey, fontSize: 13.5.sp)),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 6.r),
                child: Text(
                  "\$${product.price}",
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
            ),
          ),
          product.discount != 0
              ? Text(
                  "\$${product.oldPrice}",
                  style: TextStyle(
                      fontSize: 15.sp,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 1.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
