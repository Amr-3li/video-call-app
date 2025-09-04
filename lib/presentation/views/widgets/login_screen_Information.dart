
import 'package:flutter/cupertino.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

class LoginScreenInformation extends StatelessWidget {
  const LoginScreenInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
      children: [
        RowAppbar(title: "Sign In"),
        SizedBox(height: 40),
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Please enter your credentials for Login",
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}