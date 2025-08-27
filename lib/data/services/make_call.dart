import 'package:stream_video/stream_video.dart';

abstract class MakeCall {
  Future<Call> call(String calleeId);
  Future<void> endCall(Call call);
  Future<String> generateCallId();
}
