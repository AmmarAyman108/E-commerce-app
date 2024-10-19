import 'package:ecommerce_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterProfilePicture extends StatelessWidget {
  const RegisterProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Stack(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is UploadImageFailureState) {
              return CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(state.defaultImage),
              );
            } else if (state is UploadImageSuccessState) {
              return CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(state.image),
              );
            } else if (state is UploadImageLoadingState) {
              return const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/xm.jpg"),
              );
            }
          },
        ),
        Positioned(
          right: 0,
          bottom: 6,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {
                authCubit.selectImage();
              },
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
