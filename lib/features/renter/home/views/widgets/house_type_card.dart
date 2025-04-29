import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/renter/home/view_models/cubit/search_for_house_cubit.dart';

class HouseTypeCard extends StatelessWidget {
  const HouseTypeCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForHouseCubit, SearchForHouseState>(
      builder: (context, state) {
        var cubit = context.searchForHouseCubit;
        return GestureDetector(
          onTap: () {
            context.searchForHouseCubit.selectType(houseTypeId: index);
          },
          child: Card(
            color: (state is SelectHouseType && state.houseTypeId == index)
                ? AppColors.primaryColor
                : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                  vertical: context.height * 0.01),
              child: Center(
                child: Text(
                  cubit.houseType[index],
                  style: (state is SelectHouseType && state.houseTypeId == index)
                      ? AppTextStyles.title16White500
                      : AppTextStyles.title16GreyW500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
