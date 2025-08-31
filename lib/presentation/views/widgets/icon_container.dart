import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.icon});
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(100, 129, 129, 129)),
      ),
      child: icon,
    );
  }
}
