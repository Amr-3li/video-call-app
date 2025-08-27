part of 'make_call_cubit.dart';

@immutable
sealed class MakeCallState {}

final class MakeCallInitial extends MakeCallState {}

final class MakeCallLoading extends MakeCallState {}

final class MakeCallSuccess extends MakeCallState {
  final Call call;
  MakeCallSuccess(this.call);
}

final class MakeCallFailure extends MakeCallState {
  final String errorMessage;
  MakeCallFailure(this.errorMessage);
}

// =====End Call State=====
final class EndCallLoading extends MakeCallState {}

final class EndCallSuccess extends MakeCallState {}

final class EndCallFailure extends MakeCallState {
  final String errorMessage;
  EndCallFailure(this.errorMessage);
}
