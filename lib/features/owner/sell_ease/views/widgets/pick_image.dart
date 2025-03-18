import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_text_button.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_smooth_page_indecator.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
    required this.cubit,
  });
  final SellEaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellEaseCubit, SellEaseState>(
      builder: (context, state) {
        return Column(
          children: [
            state is SelectImageLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ))
                : cubit.files != null
                    ? SizedBox(
                        height: context.height * 0.3,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                controller: cubit.pageController,
                                itemCount: cubit.files!.length,
                                itemBuilder: (context, index) => Image.file(
                                  cubit.files![index],
                                ),
                              ),
                            ),
                            SmoothPageIndecator(
                              controller: cubit.pageController,
                              count: cubit.files!.length,
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomTextButton(
                title: "Slect Image",
                style: AppTextStyles.title20WhiteBold,
                onPressed: () {
                  cubit.pickImage();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
