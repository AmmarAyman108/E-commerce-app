import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/models/auth_model/user_info_model.dart';
import 'package:ecommerce_app/core/utils/widgets/center_indicator.dart';
import 'package:ecommerce_app/core/utils/widgets/error_widget.dart';
import 'package:ecommerce_app/features/home/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "My Profile",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
        child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
          builder: (context, state) {
            if (state is GetUserInfoSuccess) {
              return UserProfileBody(
                user: state.user,
              );
            } else if (state is GetUserInfoFailure) {
              return CustomErrorWidget(
                errorMessage: state.errorMessage,
              );
            } else {
              return CenterIndicator();
            }
          },
        ),
      ),
    );
  }
}

class UserProfileBody extends StatelessWidget {
  final UserInfoModel user;
  const UserProfileBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: user.image!,
              placeholder: (context, url) => const CenterIndicator(),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/xm.jpg"))),
              ),
            ),
          ),
        ),
        ListTile(
          contentPadding:
              EdgeInsetsDirectional.only(top: 30, bottom: 15, start: 15),
          title: Text(
            "Name",
            style: TextStyle(fontSize: 15.sp),
          ),
          subtitle: Text(
            user.name!,
            style: TextStyle(fontSize: 10.sp),
          ),
          leading: Icon(Icons.person_outline_outlined),
        ),
        ListTile(
          title: Text(
            "E-mail",
            style: TextStyle(fontSize: 15.sp),
          ),
          subtitle: Text(
            user.email!,
            style: TextStyle(fontSize: 10.sp),
          ),
          leading: Icon(Icons.email_outlined),
        ),
        ListTile(
          contentPadding:
              EdgeInsetsDirectional.only(top: 30, bottom: 15, start: 15),
          title: Text(
            "phone",
            style: TextStyle(fontSize: 15.sp),
          ),
          subtitle: Text(
            user.phone!,
            style: TextStyle(fontSize: 10.sp),
          ),
          leading: Icon(Icons.phone),
        ),
      ],
    );
  }
}
