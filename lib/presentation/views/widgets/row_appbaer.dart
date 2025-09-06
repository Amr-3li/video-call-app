import 'package:flutter/material.dart';

class RowAppbar extends StatelessWidget {
  const RowAppbar({super.key, required this.title, this.action});
  final String title;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,

            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        action ?? SizedBox(),
      ],
    );
  }
}
