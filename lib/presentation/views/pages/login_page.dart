import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/presentation/views/pages/video_call_home_page.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';

import '../../../core/dapendency_injection/get_it.dart';
import '../../../data/repo/auth/auth_repo.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../widgets/login_buttons_action.dart';
import '../widgets/login_input_information.dart';
import '../widgets/login_screen_Information.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: BackgroundApp(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  } else if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            Text("Login Success"),
                          ],
                        ),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      PageAnimations.routeTransition(
                        BlocProvider(
                          create: (context) => AuthCubit(getIt<AuthRepo>()),
                          child: VideoCallHomeScreen(),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoginScreenInformation(),
                    LoginInputInformation(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    state is! LoginLoading
                        ? LogInButtonsAction(
                            formKey: formKey,
                            emailController: emailController,
                            passwordController: passwordController,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
