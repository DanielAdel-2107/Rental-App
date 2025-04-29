import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/custom_select_number.dart';

class SelectHouseproperties extends StatelessWidget {
  const SelectHouseproperties({
    super.key,
    required this.cubit,
  });
  final SellEaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellEaseCubit, SellEaseState>(
      builder: (context, state) {
        return Column(
          spacing: context.height * 0.01,
          children: [
            CustomSelectNumber(
              title: "Bathrooms Count",
              value: cubit.numOfBathRoom,
              max: 10,
              min: 1,
              cubit: cubit,
              onChanged: (p0) {
                cubit.changeNumberOfBathRoom(p0);
              },
            ),
            CustomSelectNumber(
              title: "Number of Bedrooms",
              value: cubit.numOfbedRoom,
              max: 10,
              min: 1,
              cubit: cubit,
              onChanged: (p0) {
                cubit.changeNumberOfBedRoom(p0);
              },
            ),
            CustomSelectNumber(
              title: "Total Area",
              value: cubit.totalArea,
              cubit: cubit,
              max: 200,
              min: 70,
              onChanged: (p0) {
                cubit.changeTotalArea(p0);
              },
            ),
          ],
        );
      },
    );
  }
}
