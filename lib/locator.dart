import 'package:get_it/get_it.dart';
import 'package:split_ease/database/app_database.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
}
