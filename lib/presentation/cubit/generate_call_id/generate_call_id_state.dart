part of 'generate_call_id_cubit.dart';

@immutable
sealed class GenerateCallIdState {}

final class GenerateCallIdInitial extends GenerateCallIdState {}

final class GenerateCallIdLoading extends GenerateCallIdState {}

final class GenerateCallIdSuccess extends GenerateCallIdState {
  final String callId;
  GenerateCallIdSuccess(this.callId);
}

final class GenerateCallIdFailure extends GenerateCallIdState {
  final String errorMessage;
  GenerateCallIdFailure(this.errorMessage);
}
