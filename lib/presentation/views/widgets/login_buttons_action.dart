
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';

import '../../../core/dapendency_injection/get_it.dart';
import '../../../core/services/animation_of_routs.dart';
import '../../../data/repo/auth/auth_repo.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../pages/sign_up_page.dart';
import 'other_register.dart';

class LogInButtonsAction extends StatelessWidget {
  const LogInButtonsAction({super.key, required this.formKey, required this.emailController, required this.passwordController});
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController ;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: null,
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            text: "Sign In",
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await BlocProvider.of<AuthCubit>(
                  context,
                ).signIn(emailController.text, passwordController.text);
              }
            },
          ),
          const SizedBox(height: 15),
          const Text(
            "Continue with",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 15),
          const OtherRegister(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Not Registered yet? ",
                style: TextStyle(color: Color.fromARGB(150, 0, 0, 0)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageAnimations.routeTransition(
                      BlocProvider(
                        create: (context) =>
                            AuthCubit(getIt<AuthRepo>()),
                        child: SignUpPage(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ],
      );
  }
}
