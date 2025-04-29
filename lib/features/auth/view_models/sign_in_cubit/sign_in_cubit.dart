
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/error/supabase_exceptions.dart';
import 'package:rental_app/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:rental_app/features/auth/models/user_model.dart';
import 'package:rental_app/features/auth/view_models/sign_in_cubit/sign_in_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserModel? user;
  String route = '';
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        await signInWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        route = await getHomeScreen();
        emit(SignInSuccess(route: route));
      } on SupabaseExceptions catch (e) {
        emit(SignInFailed(errorMessage: e.errorMessage.toString()));
      } catch (e) {
        emit(SignInFailed(
            errorMessage:
                "Unexpected error occurred. Please try again later."));
      }
    }
  }

  Future<String> getHomeScreen() async {
    var data = await getIt<SupabaseClient>()
        .from("users")
        .select()
        .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
        .single();
    user = UserModel.fromJson(data);
    await getIt<CacheHelper>().saveUserModel(user!);
    if (data["role"] == "Renter") {
      return RouteNames.renterHomeScreen;
    } else {
      return RouteNames.sellEaseScreen;
    }
  }
}
