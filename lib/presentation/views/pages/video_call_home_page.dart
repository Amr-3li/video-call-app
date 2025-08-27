import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vedio_call/core/constants/animations.dart';
import 'package:vedio_call/presentation/views/widgets/make_call_container.dart';

class VideoCallHomeScreen extends StatelessWidget {
  const VideoCallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: LottieBuilder.asset(
              Animations.backgroundAnimation,
              fit: BoxFit.fitHeight,
              repeat: true,
              reverse: true,
            ),
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            ),
          ),
          MakeCallContainer(),
        ],
      ),
    );
  }
}
