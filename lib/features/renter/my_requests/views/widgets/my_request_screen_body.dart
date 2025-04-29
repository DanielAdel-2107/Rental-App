import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/helper/show_clipper_dialog.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/custom_title.dart';
import 'package:rental_app/features/renter/my_requests/view_models/cubit/my_requests_cubit.dart';
import 'package:rental_app/features/renter/my_requests/views/widgets/request_list_view.dart';

class MyRequestScreenBody extends StatelessWidget {
  const MyRequestScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.005),
        child: Column(
          children: [
            CustomTitle(
              title: "My Requests",
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            BlocProvider(
              create: (context) => MyRequestsCubit(),
              child: BlocConsumer<MyRequestsCubit, MyRequestsState>(
                listener: (context, state) {
                  if (state is DeleteRequestSuccess) {
                    return showCustomClipperDialog(
                      title: "Success",
                      message: "Request Deleted Successfully",
                    );
                  }
                  if (state is DeleteRequestFailure) {
                    return showCustomClipperDialog(
                      title: "Failure",
                      message: state.errorMessage,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is GetMyRequestsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  if (state is GetMyRequestsEmpty) {
                    return Center(
                      child: Text(
                        "Empty Requests",
                        style: AppTextStyles.title24PrimaryColorW500,
                      ),
                    );
                  }
                  final cubit = context.read<MyRequestsCubit>();
                  return RequestsListView(cubit: cubit);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
