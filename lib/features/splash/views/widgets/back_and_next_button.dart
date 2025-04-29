import 'package:flutter/material.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/components/custom_out_line_button.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class BackAndNextButton extends StatelessWidget {
  const BackAndNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.onBoardingScreenCubit;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutLineButton(
            name: "Back",
            onPressed: () {
              cubit.previousPage();
            },
          ),
          CustomElevatedButton(
            name: "Next",
            onPressed: () {
              cubit.nextPage(
                context: context,
              );
            },
          )
        ],
      ),
    );
  }
}
