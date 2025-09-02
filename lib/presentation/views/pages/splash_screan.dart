import 'package:flutter/material.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/presentation/views/pages/login_page.dart';
import 'package:vedio_call/presentation/views/pages/video_call_home_page.dart';
import 'package:vedio_call/presentation/views/widgets/splash_body.dart';

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

        duration: const Duration(seconds: 3),
        curve: Curves.easeInCirc,
        child: Center(child: SplashBody(opacity: opacity)),
        onEnd: () async {
          await Future.delayed(const Duration(seconds: 1));
          Navigator.pushReplacement(
            context,
            PageAnimations.fade(LoginPage()),
          );
        },
      ),
    );
  }
}
