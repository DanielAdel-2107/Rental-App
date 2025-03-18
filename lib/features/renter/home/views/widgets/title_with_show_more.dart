import 'package:flutter/material.dart';
import 'package:rental_app/core/components/custom_text_button.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class TitleWithShowMore extends StatelessWidget {
  const TitleWithShowMore({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.title20Black400,
        ),
        CustomTextButton(
          title: "See more",
          style: AppTextStyles.title16GreyW500,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
