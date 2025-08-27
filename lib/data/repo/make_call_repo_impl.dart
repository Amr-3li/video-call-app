import 'package:dartz/dartz.dart';
import 'package:stream_video/stream_video.dart' show Call;
import 'package:vedio_call/core/errors/failures.dart'
    show Failure, ServerFailure;
import 'package:vedio_call/data/repo/make_call_repo.dart';
import 'package:vedio_call/data/services/make_call.dart';

class MakeCallRepoImpl implements MakeCallRepo {
  final MakeCall makeCallService;

  MakeCallRepoImpl(this.makeCallService);

  @override
  Future<Either<Failure, void>> endCall(Call call) async {
    try {
      await makeCallService.endCall(call);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to end call'));
    }
  }

  @override
  Future<Either<Failure, String>> generateCallId() async {
    try {
      final callId = await makeCallService.generateCallId();
      return Right(callId);
    } catch (e) {
      return Left(ServerFailure('Failed to generate call ID'));
    }
  }

  @override
  Future<Either<Failure, Call>> makeCall(String callId) async {
    try {
      final call = await makeCallService.call(callId);
      return Right(call);
    } catch (e) {
      return Left(ServerFailure('Failed to make call'));
    }
  }

  // @override
  // Future<Either<Failure, Call>> makeCall(String callId) async {
  //   try {
  //     final call = await makeCallService.call(callId);
  //     return Right(call);
  //   } catch (e) {
  //     return Left(ServerFailure('Failed to make call'));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> endCall(Call call) async {
  //   try {
  //     await makeCallService.endCall(call);
  //     return Right(null);
  //   } catch (e) {
  //     return Left(ServerFailure('Failed to end call'));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> generateCallId() async {
  //   try {
  //     final callId =await makeCallService.generateCallId();
  //     return Right(callId );
  //   } catch (e) {
  //     return Left(ServerFailure('Failed to generate call ID'));
  //   }
  // }
}
