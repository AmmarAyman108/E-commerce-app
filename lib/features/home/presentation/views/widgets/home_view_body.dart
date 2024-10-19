import 'package:ecommerce_app/features/home/presentation/views/widgets/products_list_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/utils/widgets/const_size_box.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/user_info_tile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ConstSizeBox(
              height: 50.h,
            ),
          ),
          const SliverToBoxAdapter(
            child: UserInfoTile(),
          ),
          SliverToBoxAdapter(
            child: ConstSizeBox(
              height: 25.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "New Arrifals",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: ConstSizeBox(
              height: 12.h,
            ),
          ),
          ProductsListBuilder()
        ],
      ),
    );
  }
}
