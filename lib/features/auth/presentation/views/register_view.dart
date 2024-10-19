import 'package:ecommerce_app/core/functions/navigate_to_view.dart';
import 'package:ecommerce_app/core/utils/widgets/const_size_box.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_register_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/register_profile_Picture.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/row_text_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/top_head_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.r),
        child: SingleChildScrollView(
          child: Form(
            key: authCubit.registerFormKeyController,
            autovalidateMode: authCubit.registerAutovalidateModeController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstSizeBox(height: 30.h),
                const TopHeadLine(headLine: "REGISTER"),
                ConstSizeBox(height: 20.h),
                // Image selection and display
                const RegisterProfilePicture(),
                ConstSizeBox(height: 50.h),
                CustomTextFormFiled(
                  controller: authCubit.registerNameController,
                  hint: "Name",
                  icon: Icons.person,
                ),
                ConstSizeBox(height: 12.h),
                CustomTextFormFiled(
                  controller: authCubit.registerPhoneController,
                  hint: "Phone",
                  icon: Icons.phone,
                ),
                ConstSizeBox(height: 12.h),
                CustomTextFormFiled(
                  controller: authCubit.registerEmailController,
                  hint: "E-mail",
                  icon: Icons.email,
                ),
                ConstSizeBox(height: 12.h),
                CustomTextFormFiled(
                  controller: authCubit.registerPasswordController,
                  hint: "Password",
                  obscureText: true,
                ),
                ConstSizeBox(height: 40.h),
                const CustomRegisterButton(),
                ConstSizeBox(height: 20.h),
                RowTextButton(
                  actionTextButton: " Login",
                  leadingText: "Already have an account?",
                  onTap: () {
                    backToPrevious(context);
                  },
                ),
                ConstSizeBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
