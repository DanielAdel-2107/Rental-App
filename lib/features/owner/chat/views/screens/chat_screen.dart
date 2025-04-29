import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/components/custom_text_form_field.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/chat/view_models/cubit/chat_cubit.dart';
import 'package:rental_app/features/owner/requests/views/widgets/chat_icon_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryColor,
        title: Text("Chat", style: AppTextStyles.title24PrimaryColorW500),
      ),
      body: BlocProvider(
        create: (context) => ChatCubit(id: arguments),
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();

            if (state is ChatLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ChatLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        return BubbleSpecialThree(
                            isSender: state.messages[index].id ==
                                getIt<SupabaseClient>().auth.currentUser!.id,
                            text: state.messages[index].message,
                            color: state.messages[index].id ==
                                    getIt<SupabaseClient>().auth.currentUser!.id
                                ? AppColors.primaryColor
                                : Colors.grey.shade300,
                            tail: true,
                            textStyle: state.messages[index].id ==
                                    getIt<SupabaseClient>().auth.currentUser!.id
                                ? AppTextStyles.title18White
                                : AppTextStyles.title18PrimaryColorW500);
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.03,
                        vertical: context.height * 0.01,
                      ),
                      child: Row(
                        spacing: context.width * 0.02,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                controller: cubit.messageController,
                                hintText: "enter your message"),
                          ),
                          CustomCircleIconButton(
                            icon: Icons.send,
                            onPressed: () {
                              cubit.addMessage(
                                  text: cubit.messageController.text);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
