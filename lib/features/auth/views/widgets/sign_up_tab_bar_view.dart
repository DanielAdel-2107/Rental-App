import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/components/custom_text_form_field_with_title.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/auth/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:rental_app/features/auth/view_models/sign_up_cubit/sign_up_state.dart';

class SignUpTabBarView extends StatelessWidget {
  const SignUpTabBarView({
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
            create: (context) => SignUpCubit(),
            child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
              if (state is SignUpSuccess) {
                context.pushReplacementScreen(RouteNames.authScreen);
                showCustomClipperDialog(
                    title: "Success", message: "Create Account Successfully");
              }
              if (state is SignUpFailed) {
                showCustomClipperDialog(
                    title: "Failed", message: state.errorMessage);
              }
              if (state is FieldRequired) {
                showCustomClipperDialog(
                    title: "Info", message: "Please, Fill All Fields");
              }
            }, builder: (context, state) {
              var cubit = context.signUpCubit;
              return Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: context.height * 0.01,
                  children: [
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your name",
                      title: "User Name",
                      controller: cubit.nameController,
                    ),
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your email",
                      title: "Email",
                      controller: cubit.emailController,
                    ),
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your address",
                      title: "Address",
                      controller: cubit.addressController,
                    ),
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your age",
                      title: "Age",
                      controller: cubit.ageController,
                    ),
                    CustomTextFormFieldWithTitle(
                      hintText: "enter your password",
                      title: "Password",
                      isPassword: true,
                      controller: cubit.passwordController,
                    ),
                    SizedBox(height: context.height * 0.02),
                    state is SignUpLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : Center(
                            child: CustomElevatedButton(
                              name: "Sign Up",
                              onPressed: () {
                                cubit.signUp();
                              },
                              width: context.width * 0.8,
                              height: context.height * 0.06,
                            ),
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
