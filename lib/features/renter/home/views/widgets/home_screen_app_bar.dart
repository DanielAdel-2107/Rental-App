import 'package:flutter/material.dart';
import 'package:rental_app/core/components/custom_icon_button.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to Rental App',
                style: AppTextStyles.title24PrimaryColorW500),
          ],
        ),
        CustomIconButton(
          icon: Icons.menu,
          onPressed: () {
            // Navigate to menu screen
          },
        )
      ],
    );
  }
}
