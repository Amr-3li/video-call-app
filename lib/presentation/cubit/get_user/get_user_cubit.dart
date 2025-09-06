import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repo/auth/auth_repo.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.authRepo) : super(GetUserInitial());
  final AuthRepo authRepo;
  Future<void> getCurrentUser() async {
    emit(GetUserLoading());
    final result = await authRepo.getCurrentUser();
    result.fold(
      (error) => emit(GetUserError(error)),
      (user) => emit(GetUserSuccess(user)),
    );
  }
}
