import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/auth/views/widgets/wave_clipper.dart';

class SelectRoleScreenBody extends StatelessWidget {
  const SelectRoleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ClipPath(
          clipper: WaveClipper(isTop: true),
          child: Container(
            height: screenHeight * 0.25,
            width: double.infinity,
            color: AppColors.primaryColor,
            alignment: Alignment.center,
            child:
                Text("Choose Your Role", style: AppTextStyles.title24WhiteW500),
          ),
        ),
        const Spacer(),
        CustomElevatedButton(
          name: "Renter",
          onPressed: () {
            getIt<CacheHelper>().saveData(key: 'role', value: "Renter");
            context.pushScreen(RouteNames.authScreen);
          },
          height: screenHeight * 0.06,
          width: screenWidth * 0.8,
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          name: "Owner",
          onPressed: () {
            getIt<CacheHelper>().saveData(key: 'role', value: "Owner");
            context.pushScreen(RouteNames.authScreen);
          },
          height: screenHeight * 0.06,
          width: screenWidth * 0.8,
        ),
        const Spacer(),
        ClipPath(
          clipper: WaveClipper(isTop: false),
          child: Container(
            height: screenHeight * 0.2,
            width: double.infinity,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
