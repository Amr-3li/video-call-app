import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/widgets/icon_container.dart';

class OtherRegister extends StatelessWidget {
  const OtherRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconContainer(
          icon: Icon(Icons.apple, color: Color.fromARGB(255, 0, 0, 0)),
        ),
        SizedBox(width: 30),
        IconContainer(
          icon: Icon(Icons.facebook_sharp, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ],
    );
  }
}
