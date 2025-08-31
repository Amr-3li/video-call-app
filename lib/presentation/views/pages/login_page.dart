import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/pages/sign_up_page.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/input_iext_widget.dart';
import 'package:vedio_call/presentation/views/widgets/other_register.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.009, 0.15, 0.5, 0.5],
            colors: [
              Color.fromARGB(255, 1, 9, 101),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RowAppbar(title: "Sign In"),
              const SizedBox(height: 40),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter your credentials for Login",
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 30),
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
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: isVisible
                      ? const Icon(Icons.remove_red_eye_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
                isPassword: isVisible,
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
              ButtonWidget(text: "Sign In", onPressed: () {}),
              const SizedBox(height: 15),
              const Text("Continue with", style: TextStyle(color: Colors.grey)),
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
                        MaterialPageRoute(
                          builder: (context) =>
                              const Hero(tag: "Sign Up", child: SignUpPage()),
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
          ),
        ),
      ),
    );
  }
}
