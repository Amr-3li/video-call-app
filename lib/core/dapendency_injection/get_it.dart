import 'package:get_it/get_it.dart';
import 'package:vedio_call/data/repo/video_call/make_call_repo.dart';
import 'package:vedio_call/data/repo/video_call/make_call_repo_impl.dart';
import 'package:vedio_call/data/services/video_call/make_call.dart';
import 'package:vedio_call/data/services/video_call/make_call_impl.dart';

import '../../data/repo/auth/auth_repo.dart';
import '../../data/repo/auth/auth_repo_impl.dart';
import '../../data/services/auth/auth_services.dart';
import '../../data/services/auth/auth_services_impl.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  //============ video call============
  getIt.registerLazySingleton<MakeCall>(() => MakeCallImpl());
  getIt.registerLazySingleton<MakeCallRepo>(
    () => MakeCallRepoImpl(getIt<MakeCall>()),
  );
  //============ auth============
  getIt.registerLazySingleton<AuthServices>(() => AuthServicesImpl());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthServices>()),
  );
}
