import 'package:flutter/material.dart';
import 'package:rental_app/core/components/custom_icon_button.dart';
import 'package:rental_app/core/components/custom_text_form_field.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class SearchWithFilter extends StatelessWidget {
  const SearchWithFilter({
    super.key, this.onChanged,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.width * 0.02,
      children: [
        Expanded(
            child: CustomTextFormField(
          hintText: "Search by home name",
          perfixIcon: Icon(Icons.search),
          onChanged: onChanged,
        )),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomIconButton(
            icon: Icons.filter_list_rounded,
            color: Colors.white,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
