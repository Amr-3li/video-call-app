import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/core/constants/images.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/presentation/cubit/auth/auth_cubit.dart';
import 'package:vedio_call/presentation/cubit/get_user/get_user_cubit.dart';
import 'package:vedio_call/presentation/views/pages/splash_screan.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

import '../../../core/dapendency_injection/get_it.dart';
import '../../../data/repo/auth/auth_repo.dart';
import '../widgets/background_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: BackgroundApp(
        child: Column(
          children: [
            RowAppbar(title: "Profile"),
            Expanded(
              child: BlocBuilder<GetUserCubit, GetUserState>(
                builder: (context, state) {
                  if (state is GetUserSuccess) {
                    final user = state.user;
                    return Column(
                      children: [
                        SizedBox(height: 30),
                        ProfileAvatar(avatarUrl: user.imageUrl),
                        const SizedBox(height: 24),
                        ProfileInfo(name: user.name, email: user.email),
                        Spacer(flex: 1),
                        BlocProvider(
                          create: (context) => AuthCubit(getIt<AuthRepo>()),
                          child: BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is SignOutSuccess) {
                                Navigator.pushReplacement(
                                  context,
                                  PageAnimations.fade(SplashScrean()),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is SignOutLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ButtonWidget(
                                text: "Log Out",
                                color: Color.fromARGB(255, 62, 0, 2),
                                onPressed: () async {
                                  await context.read<AuthCubit>().signOut();
                                },
                              );
                            },
                          ),
                        ),
                                              ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Avatar Widget
class ProfileAvatar extends StatelessWidget {
  final String? avatarUrl;

  const ProfileAvatar({super.key, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: avatarUrl != null && avatarUrl != ""
              ? Image.network(avatarUrl!, fit: BoxFit.cover)
              : Image.asset(MyImages.user, fit: BoxFit.fill, height: 200),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: Icon(Icons.circle, color: Colors.green, size: 5),
        ),
      ],
    );
  }
}

// Profile Info Widget
class ProfileInfo extends StatelessWidget {
  final String name;
  final String email;

  const ProfileInfo({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
