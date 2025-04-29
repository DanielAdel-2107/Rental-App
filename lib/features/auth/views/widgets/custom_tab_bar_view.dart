import 'package:flutter/material.dart';
import 'package:rental_app/features/auth/views/widgets/sign_in_tab_bar_view.dart';
import 'package:rental_app/features/auth/views/widgets/sign_up_tab_bar_view.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          SignInTabBarView(),
          SignUpTabBarView(),
        ],
      ),
    );
  }
}
