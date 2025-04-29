import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_app/core/utilies/assets/lotties/app_lotties.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/auth/views/widgets/custom_tab_bar.dart';
import 'package:rental_app/features/auth/views/widgets/custom_tab_bar_view.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05,
            vertical: context.height * 0.005,
          ),
          child: Column(
            children: [
              Lottie.asset(AppLotties.splashLottie,
                  height: context.height * 0.25),
              CustomTabBar(),
              CustomTabBarView()
            ],
          ),
        ),
      ),
    );
  }
}
