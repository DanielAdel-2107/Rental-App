import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/assets/images/app_images.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/auth/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final user = args != null ? UserModel.fromJson(args) : null;

    return Scaffold(
      body: ProfileScreenBody(
        user: user!,
      ),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width *0.05,
          vertical: context.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.height * 0.02,
          children: [
            Center(
              child: CircleAvatar(
                radius: context.width * 0.2,
                backgroundImage: AssetImage(AppImages.profileImage),
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
              
            ),
            CustomUserInfo(title: 'Name', value: user.name),
            CustomUserInfo(title: 'Email', value: user.email),
            CustomUserInfo(title: 'Age', value: user.age),
            CustomUserInfo(title: 'Address', value: user.address),
            CustomUserInfo(title: 'Role', value: user.role),
          ],
        ),
      ),
    );
  }
}

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title24PrimaryColorW500,
        ),
        Text(
          value,
          style: AppTextStyles.title20Black400,
        ),
      ],
    );
  }
}
