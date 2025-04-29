import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_text_form_field.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/custom_label.dart';
import 'package:rental_app/features/renter/select_item/view_models/cubit/select_item_cubit.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_facilities.dart';

class SelectItemDetailsAndFields extends StatelessWidget {
  const SelectItemDetailsAndFields({
    super.key,
    required this.house,
    required this.controller,
  });
  final HouseModel house;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var cubit = context.selectItemCubit;
    return BlocBuilder<SelectItemCubit, SelectItemState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabel(
              title: "title",
              value: house.title,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            CustomLabel(
              title: "Address",
              value: cubit.locationName,
              maxLines: 2,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            Text(
              "Facilities",
              style: AppTextStyles.title18PrimaryColorW500,
            ),
            Row(
              spacing: context.width * 0.01,
              children: [
                CustomFacility(
                  icon: Icons.wash,
                ),
                CustomFacility(
                  icon: Icons.door_back_door,
                ),
                CustomFacility(
                  icon: Icons.house,
                ),
                CustomFacility(
                  icon: Icons.room_preferences_outlined,
                ),
                CustomFacility(
                  icon: Icons.microwave_rounded,
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            CustomLabel(title: "Description", value: house.description,maxLines: 5,),
            SizedBox(
              height: context.height * 0.01,
            ),
            Text(
              "Add Report To Owner If You Want To Rental Now",
              style: AppTextStyles.title18PrimaryColorW500,
            ),
            SizedBox(
              height: context.height * 0.005,
            ),
            CustomTextFormField(
              hintText: "enter your report",
              controller: controller,
            ),
          ],
        );
      },
    );
  }
}
