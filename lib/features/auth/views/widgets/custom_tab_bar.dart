import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      labelStyle: AppTextStyles.title20WhiteW500,
      unselectedLabelStyle: AppTextStyles.title20PrimaryColorW500,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      tabs: [
        Tab(
          child: Text("Sign In"),
        ),
        Tab(
          child: Text("Sign Up"),
        )
      ],
    );
  }
}
