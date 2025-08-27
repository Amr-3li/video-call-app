// ignore_for_file: deprecated_member_use, unused_catch_clause

import 'dart:math';

import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/data/services/make_call.dart';

class MakeCallImpl implements MakeCall {
  @override
  Future<Call> call(String callId) async {
    try {
      final call = StreamVideo.instance.makeCall(
        callType: StreamCallType(),
        id: callId,
      );
      await call.getOrCreate();
      return call;
    } on Exception catch (e) {
      throw Exception('Failed to make call');
    }
  }

  @override
  Future<void> endCall(Call call) async {
    try {
      await call.end();
    } on Exception catch (e) {
      throw Exception('Failed to end call');
    }
  }

  @override
  Future<String> generateCallId() async {
    await Future.delayed(const Duration(seconds: 2));
    const chars =
        'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    String callId = List.generate(
      20,
      (index) => chars[rand.nextInt(chars.length)],
    ).join();
    print('Generated Call ID: $callId');
    return callId;
  }
}
