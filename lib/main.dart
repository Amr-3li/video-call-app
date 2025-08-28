import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/core/constants/end_points.dart';
import 'package:vedio_call/core/dapendency_injection/get_it.dart';
import 'package:vedio_call/data/repo/make_call_repo.dart';
import 'package:vedio_call/presentation/cubit/make_call/make_call_cubit.dart';
import 'package:vedio_call/presentation/views/pages/video_call_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  StreamVideo(
    EndPoints.abiKey,
    user: User.regular(
      userId: EndPoints.userId,
      role: EndPoints.userRole,
      name: EndPoints.userName,
    ),
    userToken: EndPoints.userToken,
  );

  runApp(DevicePreview(builder: (context) => const MyApp()));
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
      home: BlocProvider(
        create: (context) => MakeCallCubit(getIt<MakeCallRepo>()),
        child: VideoCallHomeScreen(),
      ),
    );
  }
}
