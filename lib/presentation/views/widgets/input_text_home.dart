import 'package:flutter/material.dart';
import 'package:vedio_call/core/constants/colors.dart';

class InputTextHome extends StatelessWidget {
  const InputTextHome({super.key, required this.roomIdController});

  final TextEditingController roomIdController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.iconColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Enter room ID' : null,

        controller: roomIdController,
        decoration: const InputDecoration(
          hintText: 'Enter room ID',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
