import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/core/dapendency_injection/get_it.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/data/repo/auth/auth_repo.dart';
import 'package:vedio_call/presentation/cubit/auth/auth_cubit.dart';
import 'package:vedio_call/presentation/views/pages/splash_screan.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

import '../widgets/create_room_container.dart';
import '../widgets/join_room_container.dart';

class VideoCallHomeScreen extends StatelessWidget {
  const VideoCallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundApp(
        child: Column(
          children: [
            RowAppbar(title: "Home"),
            CreateRoomContainer(),
            JoinRoomContainer(),
            Spacer(),
            ButtonWidget(
              text: "log out",
              onPressed: () async {
                await context.read<AuthCubit>().signOut();
                Navigator.pushReplacement(
                  context,
                  PageAnimations.routeTransition(
                    BlocProvider(
                      create: (context) => AuthCubit(getIt<AuthRepo>()),
                      child: SplashScrean(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
