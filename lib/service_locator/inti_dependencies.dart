import 'package:bloc_test/bloc/area_of_circle_bloc.dart';
import 'package:bloc_test/bloc/simple_interest_bloc.dart';
import 'package:bloc_test/bloc/student_list_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerLazySingleton(() => CircleBloc());
  serviceLocator.registerLazySingleton(() => InterestBloc());
  serviceLocator.registerLazySingleton(() => StudentBloc());
}
