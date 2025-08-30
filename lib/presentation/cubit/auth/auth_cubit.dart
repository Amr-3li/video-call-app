import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vedio_call/data/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
}
