import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/widgets/user_name_data.dart';

import 'input_text_widget.dart';

class SignUpInputsInformation extends StatefulWidget {
  const SignUpInputsInformation({
    super.key,
    required this.fNameController,
    required this.lNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });
  final TextEditingController fNameController;
  final TextEditingController lNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpInputsInformation> createState() =>
      _SignUpInputsInformationState();
}

class _SignUpInputsInformationState extends State<SignUpInputsInformation> {
  bool isVisible1 = true, isVisible2 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        UserNameData(
          fNameController: widget.fNameController,
          lNameController: widget.lNameController,
        ),
        const SizedBox(height: 20),
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
              isVisible1 = !isVisible1;
              setState(() {});
            },
            icon: isVisible1
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(Icons.visibility_off_outlined),
          ),
          isPassword: isVisible1,
        ),
        const SizedBox(height: 20),
        InputTextWidget(
          controller: widget.confirmPasswordController,
          hintText: "Confirm Password",
          icon: IconButton(
            onPressed: () {
              isVisible2 = !isVisible2;
              setState(() {});
            },
            icon: isVisible2
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(Icons.visibility_off_outlined),
          ),
          isPassword: isVisible2,
        ),
      ],
    );
  }
}
