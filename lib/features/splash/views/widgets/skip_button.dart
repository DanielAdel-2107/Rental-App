import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomElevatedButton(
          name: "Skip",
          forgroundColor: Colors.white,
          onPressed: () {
            context.pushReplacementScreen(RouteNames.selectRoleScreen);
          },
        )
      ],
    );
  }
}
