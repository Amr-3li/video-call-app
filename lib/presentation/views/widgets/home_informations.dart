import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';

class HomeInformations extends StatelessWidget {
  const HomeInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: Strings.video,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 149, 1, 212),
            ),
            children: [
              TextSpan(
                text: Strings.call,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            Strings.brief,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
