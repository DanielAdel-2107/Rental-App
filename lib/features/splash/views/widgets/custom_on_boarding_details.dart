import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class CustomOnBoardingDetails extends StatelessWidget {
  const CustomOnBoardingDetails({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.005),
      child: Column(
        spacing: context.height * 0.01,
        children: [
          Lottie.asset(image,
              width: context.width * 0.8, height: context.height * 0.5),
          Text(
            title,
            style: AppTextStyles.title28PrimaryColorW500,
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: AppTextStyles.title18Black,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
