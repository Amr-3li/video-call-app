import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.zero,
        backgroundColor: const Color.fromARGB(160, 149, 1, 212),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: Size(MediaQuery.of(context).size.width / 2, 30),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 190, 190, 190),
          ),
        ),
      ),
    );
  }
}
