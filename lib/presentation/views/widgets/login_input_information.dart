import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_text_widget.dart';


class LoginInputInformation extends StatefulWidget {
  const LoginInputInformation({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginInputInformation> createState() => _LoginInputInformationState();
}

class _LoginInputInformationState extends State<LoginInputInformation> {
  bool isVisible= true;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: 30),
        InputTextWidget(
          controller: widget.emailController,
          hintText: "Enter Email Address",
          icon: const IconButton(
            onPressed: null,
            icon: Icon(Icons.email_outlined),
          ),
        ),
        const SizedBox(height: 20),
        InputTextWidget(
          controller: widget.passwordController,
          hintText: "Enter Password",
          icon: IconButton(
            onPressed: () {
              isVisible = !isVisible;
              setState(() {});
            },
            icon: isVisible
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(Icons.visibility_off_outlined),
          ),
          isPassword: isVisible,
        ),
      ],
    );
  }
}
