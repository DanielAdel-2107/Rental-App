import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_text_button.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/custom_number_picker.dart';

class CustomSelectNumber extends StatelessWidget {
  const CustomSelectNumber({
    super.key,
    required this.title,
    this.min,
    this.max,
    this.value,
    required this.onChanged,
    required this.cubit,
  });
  final String title;
  final int? min, max;
  final int? value;
  final Function(int) onChanged;
  final SellEaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title:   ${value ?? ''}",
          style: AppTextStyles.title20PrimaryColorW500,
        ),
        CustomTextButton(
          title: "Select",
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: context.height * 0.5,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.05,
                    vertical: context.height * 0.01,
                  ),
                  child: BlocProvider.value(
                    value: cubit,
                    child: CustomNumberPicker(
                      title: title,
                      max: max,
                      min: min,
                      onChanged: onChanged,
                      value: value??min!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
