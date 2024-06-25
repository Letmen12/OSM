import 'package:get_it/get_it.dart';
import 'location/location_cubit.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => LocationCubit());
}
