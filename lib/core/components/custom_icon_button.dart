import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.color,
  });
  final Function()? onPressed;
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color ?? AppColors.primaryColor,
        size: context.width * 0.08,
      ),
    );
  }
}
