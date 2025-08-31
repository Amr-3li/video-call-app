import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/pages/login_page.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/input_iext_widget.dart';
import 'package:vedio_call/presentation/views/widgets/other_register.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';
import 'package:vedio_call/presentation/views/widgets/user_name_data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isVisible1 = true, isVisible2 = true;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RowAppbar(title: "Sign Up"),
                const SizedBox(height: 40),
                const Text(
                  " Create Account",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please enter your information and create account",
                  style: TextStyle(
                    color: Color.fromARGB(150, 0, 0, 0),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 30),
                UserNameData(
                  fNameController: fNameController,
                  lNameController: lNameController,
                ),
                const SizedBox(height: 20),
                InputTextWidget(
                  controller: emailController,
                  hintText: "Enter Email Address",
                  icon: const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                InputTextWidget(
                  controller: passwordController,
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
                  controller: confirmPasswordController,
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
                const Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ButtonWidget(text: "Sign Up", onPressed: () {}),
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
                      "Have an account? ",
                      style: TextStyle(color: Color.fromARGB(150, 0, 0, 0)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
