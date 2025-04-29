import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/renter/select_item/view_models/cubit/select_item_cubit.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_image_builder.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_smooth_page_indecator.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/rent_house.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/select_item_details_and_fields.dart';

class SelectItemScreenBody extends StatelessWidget {
  const SelectItemScreenBody({
    super.key,
    required this.house,
  });
  final HouseModel house;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectItemCubit(),
      child: BlocConsumer<SelectItemCubit, SelectItemState>(
        listener: (context, state) {
          if (state is AddRequestSuccess) {
            showCustomClipperDialog(
                title: "Success", message: "Your Request Added Successfully");
          }
          if (state is RequestAlreadyAdded) {
            showCustomClipperDialog(
                title: "Info",
                message: "Your Request Already Added Successfully");
          }
          if (state is AddRequestFailed) {
            showCustomClipperDialog(title: "Failure", message: state.error);
          }
        },
        builder: (context, state) {
          var cubit = context.selectItemCubit;
         cubit.getPlaceName(
              latitude: house.latitude, longitude: house.longitude);
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.05,
                  vertical: context.height * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height * 0.5,
                      child: CustomImageBuilder(
                        controller: cubit.controller,
                        images: house.image,
                      ),
                    ),
                    Center(
                      child: SmoothPageIndecator(
                        controller: cubit.controller,
                        count: house.image.length,
                      ),
                    ),
                    SelectItemDetailsAndFields(
                      house: house,
                      controller: cubit.reportController,
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    RentHouse(house: house, cubit: cubit)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
