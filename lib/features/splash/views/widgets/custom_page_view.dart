import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.onBoardingScreenCubit;
    return Expanded(
      child: PageView.builder(
        controller: cubit.pageController,
        onPageChanged: (value) {
          cubit.changePage(value);
        },
        itemBuilder: (context, index) {
          return context
              .onBoardingScreenCubit.onBoardingSteps[index];
        },
        itemCount: 3,
      ),
    );
  }
}
