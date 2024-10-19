import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/core/utils/constant.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
        Navigator.pushNamed(context, Routes.myProfile);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
          radius: 28.r,
          backgroundImage: AssetImage(Hive.box(Constants.userBox).get('image')),
        ),
        title: Text(
          Hive.box(Constants.userBox).get('name'),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Let\'s go shopping',
            style: TextStyle(color: Colors.grey, fontSize: 11.5.sp)),
        trailing: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pushNamed(context, Routes.search);
            },
            icon: Icon(
              Icons.search_rounded,
              size: 35.r,
            )),
      ),
    );
  }
}
