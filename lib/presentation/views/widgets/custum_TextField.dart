import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController callIdController,
    required this.lable,
  }) : _callIdController = callIdController;

  final TextEditingController _callIdController;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $lable';
        }
        return null;
      },

      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      controller: _callIdController,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: const Color.fromARGB(255, 145, 145, 145)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        //   borderSide: const BorderSide(color: Colors.white),
        // ),
        labelText: lable,
        floatingLabelStyle: const TextStyle(color: Colors.white),
      ),

      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
