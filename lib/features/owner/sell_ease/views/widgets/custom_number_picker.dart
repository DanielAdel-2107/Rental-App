import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';

class CustomNumberPicker extends StatelessWidget {
  const CustomNumberPicker({
    super.key,
    required this.title,
    this.min,
    this.max,
    required this.onChanged,
    required this.value,
  });

  final String title;
  final int? min, max;
  final Function(int) onChanged;
  final int value;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellEaseCubit, SellEaseState>(
      builder: (context, state) {
        var cubit = context.read<SellEaseCubit>();
        int value;
        if (title == "Bathrooms Count") {
          value = cubit.numOfBathRoom ?? min ?? 1;
        } else if (title == "Number of Bedrooms") {
          value = cubit.numOfbedRoom ?? min ?? 1;
        } else {
          value = cubit.totalArea ?? min ?? 50;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.title20PrimaryColorW500,
                ),
                SizedBox(
                  width: context.width * 0.07,
                ),
                Text(
                  value.toString(),
                  style: AppTextStyles.title20Black400,
                ),
              ],
            ),
            NumberPicker(
              axis: Axis.horizontal,
              value: value,
              minValue: min != null ? min! - 1 : 1,
              maxValue: max ?? 10,
              onChanged: (p0) {
                onChanged(p0);
              },
            ),
          ],
        );
      },
    );
  }
}
