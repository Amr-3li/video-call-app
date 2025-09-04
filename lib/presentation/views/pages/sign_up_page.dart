import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/input_text_widget.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';
import 'package:vedio_call/presentation/views/widgets/sign_up_informaion_screen.dart';
import 'package:vedio_call/presentation/views/widgets/user_name_data.dart';

import '../widgets/sign_up_inputs_information.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BackgroundApp(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const SignUpInformationScreen(),
                SignUpInputsInformation(
                  formKey: formKey,
                  confirmPasswordController: confirmPasswordController,
                  emailController: emailController,
                  fNameController: fNameController,
                  lNameController: lNameController,
                  passwordController: passwordController,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}