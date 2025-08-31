import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vedio_call/core/constants/animations.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key, required this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        LottieBuilder.asset(
          Animations.videoCall,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          fit: BoxFit.cover,
        ),
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeInCirc,
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              color: const Color(0xff6772E5),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
