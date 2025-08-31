import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {super.key,
      required this.controller,
      this.isPassword = false,
      this.hintText = "",
      this.icon});

  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final IconButton? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(60, 0, 0, 0), width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(170, 0, 0, 0), width: 1)),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          suffixIcon: icon ??
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.transparent,
                  )),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromARGB(80, 0, 0, 0), fontSize: 13)),
    );
  }
}
