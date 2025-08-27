import 'package:get_it/get_it.dart';
import 'package:vedio_call/data/repo/make_call_repo.dart';
import 'package:vedio_call/data/repo/make_call_repo_impl.dart';
import 'package:vedio_call/data/services/make_call.dart';
import 'package:vedio_call/data/services/make_call_impl.dart';

GetIt getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<MakeCall>(() => MakeCallImpl());
  getIt.registerLazySingleton<MakeCallRepo>(
    () => MakeCallRepoImpl(getIt<MakeCall>()),
  );
}
