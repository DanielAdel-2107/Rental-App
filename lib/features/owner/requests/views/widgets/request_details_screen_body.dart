import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
import 'package:rental_app/features/owner/requests/view_models/request_details_cubit/request_details_cubit.dart';
import 'package:rental_app/features/owner/requests/views/widgets/custom_page_view_builder.dart';
import 'package:rental_app/features/owner/requests/views/widgets/request_details.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_smooth_page_indecator.dart';

class RequestDetailsScreenBody extends StatelessWidget {
  const RequestDetailsScreenBody({
    super.key,
    required this.requestModel,
  });
  final RequestModel? requestModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestDetailsCubit(),
      child: BlocConsumer<RequestDetailsCubit, RequestDetailsState>(
        listener: (context, state) {
          if (state is UpdateRequestStateFailed) {
            return showCustomClipperDialog(
                title: "Failure", message: state.error);
          } else if (state is UpdateRequestStateSuccess) {
            context.popScreen();
            return showCustomClipperDialog(
                title: "Success", message: "State Updated successfully");
          } else if (state is UpdateRequestStateAcceptedSuccess) {
            context.popScreen();
            return showCustomClipperDialog(
                title: "Success",
                message:
                    "State Updated successfully\nNow you can chat with renter ${requestModel!.userName}");
          } else if (state is RequestStateEmpty) {
            return showCustomClipperDialog(
                title: "Info", message: "Please select state");
          }
        },
        builder: (context, state) {
          final cubit = context.read<RequestDetailsCubit>();
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.05,
                vertical: context.height * 0.01,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomPageViewBuilder(images: requestModel!.images),
                    Center(
                      child: SmoothPageIndecator(
                        controller: cubit.pageController,
                        count: requestModel!.images.length,
                      ),
                    ),
                    RequestDetails(requestModel: requestModel, cubit: cubit)
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
