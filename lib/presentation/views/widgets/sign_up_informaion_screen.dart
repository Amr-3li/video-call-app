
import 'package:flutter/cupertino.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

class SignUpInformationScreen extends StatelessWidget {
  const SignUpInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RowAppbar(title: "Sign Up"),
        SizedBox(height: 40),
        Text(
          " Create Account",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Please enter your information and create account",
          style: TextStyle(
            color: Color.fromARGB(150, 0, 0, 0),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
