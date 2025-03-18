import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_text_button.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
    required this.cubit,
  });
  final SellEaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellEaseCubit, SellEaseState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Location",
              style: AppTextStyles.title20PrimaryColorW500,
            ),
            state is SelectLocationLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : cubit.position != null
                    ? Text("Position is selected",
                        style: AppTextStyles.title18PrimaryColorW500)
                    : CustomTextButton(
                        title: "Select",
                        style: AppTextStyles.title18PrimaryColorW500,
                        onPressed: () async {
                          await cubit.getLocation();
                        },
                      )
          ],
        );
      },
    );
  }
}
