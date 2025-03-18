import 'package:flutter/material.dart';
import 'package:rental_app/core/components/custom_drop_down_button_form_field.dart';
import 'package:rental_app/core/components/custom_text_form_field_with_title.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';

class SellEaseFields extends StatelessWidget {
  const SellEaseFields({
    super.key,
    required this.cubit,
  });
  final SellEaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: context.height * 0.01,
        children: [
          CustomTextFormFieldWithTitle(
            hintText: "enter user name",
            title: "User Name",
            controller: cubit.userNameController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "enter home title",
            title: "Home Title",
            controller: cubit.houseNameController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "enter home description",
            title: "Home Description",
            controller: cubit.houseDescriptionController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "enter home price",
            title: "Price",
            controller: cubit.priceController,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.height * 0.005,
            children: [
              Text(
                "Category",
                style: AppTextStyles.title18PrimaryColorW500,
              ),
              CustomDropDownButtonFormField(
                userRoles: [
                  "House",
                  "Apartment",
                  "Villa",
                  "Hotel",
                  "Townhouse"
                ],
                hintText: "Select Type",
                controller: cubit.typeController,
              ),
            ],
          ),
          CustomTextFormFieldWithTitle(
            hintText: "enter more date",
            title: "More Date ( Optional )",
            maxLines: 3,
            controller: cubit.moreDateController,
            enableValidator: false,
          ),
        ],
      ),
    );
  }
}
