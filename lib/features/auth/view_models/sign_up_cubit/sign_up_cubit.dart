import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/error/supabase_exceptions.dart';
import 'package:rental_app/core/network/supabase/auth/sign_up_with_password.dart';
import 'package:rental_app/core/network/supabase/database/add_data.dart';
import 'package:rental_app/features/auth/view_models/sign_up_cubit/sign_up_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignUpLoading());
        await signUpWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await addData(tableName: "users", data: {
          "id": getIt<SupabaseClient>().auth.currentUser!.id,
          "user_name": nameController.text,
          "role": getIt<CacheHelper>().getDataString(key: 'role'),
          "email": emailController.text,
          "address": addressController.text,
          "age": ageController.text,
        });
        emit(SignUpSuccess());
      } on SupabaseExceptions catch (e) {
        emit(SignUpFailed(errorMessage: e.errorMessage.toString()));
      } catch (e) {
        emit(SignUpFailed(
            errorMessage:
                "Unexpected error occurred. Please try again later."));
      }
    } else {
      emit(FieldRequired());
    }
  }
}
