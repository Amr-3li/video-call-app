import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/core/dapendency_injection/get_it.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/core/services/font_size_handeler.dart';
import 'package:vedio_call/data/repo/auth/auth_repo.dart';
import 'package:vedio_call/data/repo/video_call/make_call_repo.dart';
import 'package:vedio_call/presentation/cubit/auth/auth_cubit.dart';
import 'package:vedio_call/presentation/cubit/get_user/get_user_cubit.dart';
import 'package:vedio_call/presentation/cubit/make_call/make_call_cubit.dart';
import 'package:vedio_call/presentation/views/pages/profile_screen.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/input_text_home.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

import '../widgets/create_room_container.dart';
import '../widgets/join_room_container.dart';

class VideoCallHomeScreen extends StatelessWidget {
  const VideoCallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController roomIdController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: BackgroundApp(
        child: BlocProvider(
          create: (context) => MakeCallCubit(getIt<MakeCallRepo>()),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                RowAppbar(
                  title: "Home",
                  action: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageAnimations.routeTransition(
                          MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                    AuthCubit(getIt<AuthRepo>()),
                              ),
                              BlocProvider(
                                create: (context) =>
                                    GetUserCubit(getIt<AuthRepo>())
                                      ..getCurrentUser(),
                              ),
                            ],
                            child: ProfileScreen(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                CreateRoomContainer(),
                Text(
                  "Join Room",
                  style: TextStyle(
                    fontSize: getResposiveSize(context, fontSize: 30),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                InputTextHome(roomIdController: roomIdController),
                JoinRoomContainer(
                  formKey: formKey,
                  roomIdController: roomIdController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
