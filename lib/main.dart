import 'package:flutter/material.dart';
import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/core/constants/end_points.dart';
import 'package:vedio_call/features/video_call/presentation/view/pages/video_call_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final client = StreamVideo(
    EndPoints.abiKey,
    user: User.regular(
      userId: EndPoints.userId,
      role: EndPoints.userRole,
      name: EndPoints.userName,
    ),
    userToken: EndPoints.userToken,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: VideoCallHomeScreen(),
    );
  }
}
