import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/renter/select_item/view_models/cubit/select_item_cubit.dart';

class RentHouse extends StatelessWidget {
  const RentHouse({
    super.key,
    required this.house,
    required this.cubit,
  });

  final HouseModel house;
  final SelectItemCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectItemCubit, SelectItemState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: AppTextStyles.title20PrimaryColorW500,
                ),
                Text(
                  house.price,
                  style: AppTextStyles.title16GreyW500,
                ),
              ],
            ),
            state is AddRequestLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ))
                : CustomElevatedButton(
                    name: "Rental Now",
                    onPressed: () {
                      cubit.addRequest(house: house);
                    },
                  )
          ],
        );
      },
    );
  }
}
