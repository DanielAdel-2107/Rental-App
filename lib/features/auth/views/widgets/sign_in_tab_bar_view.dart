import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/components/custom_text_button.dart';
import 'package:rental_app/core/components/custom_text_form_field_with_title.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/auth/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:rental_app/features/auth/view_models/sign_in_cubit/sign_in_state.dart';

class SignInTabBarView extends StatelessWidget {
  const SignInTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          left: context.width * 0.02,
          right: context.width * 0.02,
          top: context.height * 0.03,
        ),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => SignInCubit(),
            child: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
              if (state is SignInSuccess) {
                context.pushAndRemoveUntilScreen(state.route);
                showCustomClipperDialog(
                    title: "Success", message: "Login Successfully");
              }
              if (state is SignInFailed) {
                showCustomClipperDialog(
                    title: "Failed", message: state.errorMessage);
              }
            }, builder: (context, state) {
              var cubit = context.signInCubit;
              return Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: context.height * 0.01,
                  children: [
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your email",
                      title: "Email",
                      controller: cubit.emailController,
                    ),
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your password",
                      title: "Password",
                      isPassword: true,
                      controller: cubit.passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                            title: "Forgot Password?", onPressed: () {}),
                      ],
                    ),
                    state is SignInLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))
                        : CustomElevatedButton(
                            name: "Sign In",
                            onPressed: () {
                              cubit.signIn();
                            },
                            width: context.width * 0.8,
                            height: context.height * 0.06,
                          ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
