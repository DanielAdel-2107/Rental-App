import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class CustomOutLineButton extends StatelessWidget {
  const CustomOutLineButton({
    super.key,
    required this.name,
    this.onPressed,
    this.textStyle,
    this.hPadding,
    this.wPadding,
    this.height,
    this.width,
    this.backgroundColor,
    this.forgroundColor,
  });
  final String name;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final double? hPadding, wPadding;
  final double? height, width;
  final Color? backgroundColor;
  final Color? forgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: forgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 0.01,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: textStyle ?? AppTextStyles.title20PrimaryColorW500,
      ),
    );
  }
}
