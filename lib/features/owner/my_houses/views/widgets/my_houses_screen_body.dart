import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/view_models/cubit/my_houses_cubit.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/custom_title.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/my_house_card.dart';

class MyHousesScreenBody extends StatelessWidget {
  const MyHousesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyHousesCubit(),
      child: BlocBuilder<MyHousesCubit, MyHousesState>(
        builder: (context, state) {
          if (state is GetMyHouseEmpty) {
            return Center(
              child: Text(
                "Empty Houses",
                style: AppTextStyles.title20PrimaryColorW500,
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is GetMyHouseLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is GetMyHouseFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.title20PrimaryColorW500,
                textAlign: TextAlign.center,
              ),
            );
          }
          var cubit = context.read<MyHousesCubit>();
          return SafeArea(
            child: Column(
              children: [
                CustomTitle(
                  title: 'My Houses',
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.03,
                      vertical: context.height * 0.01,
                    ),
                    itemCount: cubit.myHouses.length,
                    itemBuilder: (context, index) {
                      return MyHouseCard(
                        controller: cubit.pageController,
                        houseModel: cubit.myHouses[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
