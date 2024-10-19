import 'package:ecommerce_app/config/router/routes.dart';
import 'package:ecommerce_app/core/functions/navigate_to_view.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/extension.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          context.showSnackBar(content: Text(state.authModel.message!));
          navigateToView(context, route: Routes.home);
        } else if (state is RegisterFailureState) {
          context.showSnackBar(
            content: Text(
              state.errorMessage,
              style: const TextStyle(color: ColorManager.red),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          child: getChild(state),
          onTap: () {
            if (authCubit.registerFormKeyController.currentState!.validate()) {
              authCubit.register(
                context,
                email: authCubit.registerEmailController.text,
                password: authCubit.registerPasswordController.text,
                name: authCubit.registerNameController.text,
                phone: authCubit.registerPhoneController.text,
              );
            } else {
              authCubit.registerAutovalidateModeController =
                  AutovalidateMode.always;
            }
          },
        );
      },
    );
  }

  Widget getChild(AuthState state) {
    if (state is RegisterLoadingState) {
      return const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          color: ColorManager.white,
        ),
      );
    } else if (state is RegisterFailureState) {
      return Text(
        "Error, try again",
        style: TextStyle(
          fontSize: 18.sp,
          color: ColorManager.red,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return Text(
        "Register",
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
