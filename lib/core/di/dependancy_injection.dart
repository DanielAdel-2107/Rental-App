import 'package:get_it/get_it.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupDI() async {
  final supabase = Supabase.instance.client;
  getIt.registerSingleton<SupabaseClient>(supabase);

  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerSingleton<CacheHelper>(cacheHelper);
}
