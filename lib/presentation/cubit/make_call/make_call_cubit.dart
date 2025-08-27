// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_video/stream_video.dart';

import 'package:vedio_call/data/repo/make_call_repo.dart';

part 'make_call_state.dart';

class MakeCallCubit extends Cubit<MakeCallState> {
  MakeCallCubit(this.makeCallRepo) : super(MakeCallInitial());
  final MakeCallRepo makeCallRepo;
  Future<void> makeCall(String callId) async {
    emit(MakeCallLoading());
    final result = await makeCallRepo.makeCall(callId);
    result.fold(
      (failure) => emit(MakeCallFailure(failure.toString())),
      (call) => emit(MakeCallSuccess(call)),
    );
  }

  Future<void> endCall(Call call) async {
    emit(EndCallLoading());
    final result = await makeCallRepo.endCall(call);
    result.fold(
      (failure) => emit(EndCallFailure(failure.toString())),
      (_) => emit(EndCallSuccess()),
    );
  }
}
