// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:vedio_call/data/repo/video_call/make_call_repo.dart';

part 'generate_call_id_state.dart';

class GenerateCallIdCubit extends Cubit<GenerateCallIdState> {
  GenerateCallIdCubit(this.makeCallRepo) : super(GenerateCallIdInitial());
  final MakeCallRepo makeCallRepo;
  Future<void> generateCallId() async {
    emit(GenerateCallIdLoading());
    final result = await makeCallRepo.generateCallId();
    result.fold(
      (failure) => emit(GenerateCallIdFailure(failure.toString())),
      (callId) => emit(GenerateCallIdSuccess(callId)),
    );
  }
}
