import 'package:dartz/dartz.dart';
import 'package:stream_video/stream_video.dart' show Call;
import 'package:vedio_call/core/errors/failures.dart' show Failure;

abstract class MakeCallRepo {
  Future<Either<Failure, void>> endCall(Call call);
  Future<Either<Failure, String>> generateCallId();
  Future<Either<Failure, Call>> makeCall(String callId);
}
