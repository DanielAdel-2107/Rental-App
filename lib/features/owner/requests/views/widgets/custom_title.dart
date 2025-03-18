import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.08,
        vertical: context.height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.5),
            Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.title24PrimaryColorW500,
      ),
    );
  }
}
