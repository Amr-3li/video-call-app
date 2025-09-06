import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/sign_up_informaion_screen.dart';

import '../../cubit/auth/auth_cubit.dart';
import '../widgets/sign_up_buttons_action.dart';
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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Register Success")));
                } else if (state is RegisterFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) => Column(
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
                  state is! RegisterLoading
                      ? SignUpButtonsAction(
                          formKey: formKey,
                          name:
                              "${fNameController.text} ${lNameController.text}",
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
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
