import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class CustomCircleElevatedButton extends StatelessWidget {
  const CustomCircleElevatedButton({
    super.key, required this.icon, this.onPressed,
  });
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: context.height * 0.002),
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
      ),
      child: Icon(
        icon,
        size: context.height * 0.04,
        color: Colors.white,
      ),
    );
  }
}
