import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/core/functions/navigate_to_view.dart';
import 'package:ecommerce_app/core/utils/widgets/const_size_box.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/row_text_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/top_head_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.r),
        child: SingleChildScrollView(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Form(
                autovalidateMode: authCubit.loginAutovalidateModeController,
                key: authCubit.loginFormKeyController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstSizeBox(
                      height: 200.h,
                    ),
                    const TopHeadLine(
                      headLine: "LOGIN",
                    ),
                    ConstSizeBox(
                      height: 50.h,
                    ),
                    CustomTextFormFiled(
                      controller: authCubit.loginEmailController,
                      hint: "E-mail",
                      icon: Icons.email,
                    ),
                    ConstSizeBox(
                      height: 12.h,
                    ),
                    CustomTextFormFiled(
                      controller: authCubit.loginPasswordController,
                      hint: "password",
                      obscureText: true,
                    ),
                    ConstSizeBox(
                      height: 40.h,
                    ),
                    const CustomLoginButton(),
                    ConstSizeBox(
                      height: 20.h,
                    ),
                    RowTextButton(
                      actionTextButton: " Register",
                      leadingText: "Don't have an account?",
                      onTap: () {
                        navigateToView(context, route: Routes.register);
                      },
                    ),
                    ConstSizeBox(
                      height: 50.h,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
