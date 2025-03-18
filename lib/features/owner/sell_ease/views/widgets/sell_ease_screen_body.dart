import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/sell_ease/view_models/cubit/sell_ease_cubit.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/pick_image.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/select_house_properties.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/select_location.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/sell_ease_fields.dart';

class SellEaseScreenBody extends StatelessWidget {
  const SellEaseScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.01,
      ),
      child: BlocProvider(
        create: (context) => SellEaseCubit(),
        child: BlocConsumer<SellEaseCubit, SellEaseState>(
          listener: (context, state) {
            if (state is UploadDataSuccess) {
              context.pushReplacementScreen(RouteNames.sellEaseScreen);
              showCustomClipperDialog(
                  title: "Success", message: "House Uploaded Successfully");
            }
            if (state is UploadDataFailure) {
              showCustomClipperDialog(
                  title: "Failure", message: state.errorMessage);
            }
            if (state is SelectLocationFailure) {
              showCustomClipperDialog(
                  title: "Failure", message: state.errorMessage);
            }
            if (state is SelectImageFailure) {
              showCustomClipperDialog(
                  title: "Failure", message: state.errorMessage);
            }
          },
          builder: (context, state) {
            var cubit = context.read<SellEaseCubit>();
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  spacing: context.height * 0.01,
                  children: [
                    PickImage(cubit: cubit),
                    SellEaseFields(cubit: cubit),
                    SelectHouseproperties(
                      cubit: cubit,
                    ),
                    SelectLocation(
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    state is UploadDataLoading
                        ? CircularProgressIndicator()
                        : CustomElevatedButton(
                            name: "Upload",
                            onPressed: () async {
                              await cubit.uploadHouse();
                            },
                            width: context.width * 0.9,
                            height: context.height * 0.07,
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
