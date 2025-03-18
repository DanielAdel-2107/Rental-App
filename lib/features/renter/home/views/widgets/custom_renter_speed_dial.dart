import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/auth/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomRenterSpeedDial extends StatelessWidget {
  const CustomRenterSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      foregroundColor: Colors.white,
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: AppColors.primaryColor,
      spacing: context.height * 0.003,
      spaceBetweenChildren: context.height * 0.01,
      children: [
        customSpeedDialChild(
            title: 'Logout',
            onTap: () async {
              await getIt<SupabaseClient>().auth.signOut();
              context.pushAndRemoveUntilScreen(RouteNames.selectRoleScreen);
            },
            icon: Icons.logout_outlined),
        customSpeedDialChild(
            title: 'Profile',
            onTap: () {
              UserModel user = getIt<CacheHelper>().getUserModel()!;
              context.pushScreen(RouteNames.profileScreen,
                  arguments: user.toJson());
            },
            icon: Icons.person),
        customSpeedDialChild(
            title: 'My Requests',
            onTap: () {
              context.pushScreen(RouteNames.renterRequestsScreen);
            },
            icon: Icons.house),
      ],
    );
  }

  SpeedDialChild customSpeedDialChild(
      {required String title,
      required Function()? onTap,
      required IconData icon}) {
    return SpeedDialChild(
      child: Icon(icon),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      labelStyle: AppTextStyles.title18PrimaryColorW500,
      labelBackgroundColor: Colors.white,
      label: title,
      onTap: onTap,
    );
  }
}
