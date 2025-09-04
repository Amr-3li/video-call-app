import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/core/dapendency_injection/get_it.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/data/repo/auth/auth_repo.dart';
import 'package:vedio_call/presentation/cubit/auth/auth_cubit.dart';
import 'package:vedio_call/presentation/views/pages/login_page.dart';
import 'package:vedio_call/presentation/views/pages/video_call_home_page.dart';
import 'package:vedio_call/presentation/views/widgets/splash_body.dart';

import '../../../core/constants/end_points.dart';
import '../../../core/services/sharedpreference_singelton.dart';

class SplashScrean extends StatefulWidget {
  const SplashScrean({super.key});

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacity,

        duration: const Duration(seconds: 2),
        curve: Curves.easeInCirc,
        child: Center(child: SplashBody(opacity: opacity)),
        onEnd: () async {
          String userId = SharedPreferenceSingelton.getString("userId");
          String userName = SharedPreferenceSingelton.getString("userName");
          if (userId.isNotEmpty) {
            StreamVideo(
              EndPoints.abiKey,
              user: User.regular(
                userId: EndPoints.userId,
                role: EndPoints.userRole,
                name: userName,
              ),
              userToken: EndPoints.userToken,
            );
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pushReplacement(
              context,
              PageAnimations.slide(VideoCallHomeScreen()),
            );
          }
          await Future.delayed(const Duration(seconds: 3));
          Navigator.pushReplacement(
            context,
            PageAnimations.slide(
              BlocProvider(
                create: (context) => AuthCubit(getIt<AuthRepo>()),
                child: LoginPage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
