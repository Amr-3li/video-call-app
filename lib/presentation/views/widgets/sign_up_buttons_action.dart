import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth/auth_cubit.dart';
import 'button_widget.dart';

class SignUpButtonsAction extends StatelessWidget {
  const SignUpButtonsAction({
    super.key,
    required this.formKey,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  final GlobalKey<FormState> formKey;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          text: "Sign Up",
          onPressed: () async {
            if (formKey.currentState!.validate() &&
                password == confirmPassword) {
              await context.read<AuthCubit>().signUp(email,password,name);
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Password not match")));
            }
          },
        ),
        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Have an account? ",
              style: TextStyle(color: Color.fromARGB(150, 0, 0, 0)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Sign in",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
