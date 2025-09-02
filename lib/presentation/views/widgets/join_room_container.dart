import 'package:flutter/material.dart';
import 'package:vedio_call/core/constants/colors.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';

import '../../../core/services/font_size_handeler.dart';

class JoinRoomContainer extends StatelessWidget {
  const JoinRoomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController roomIdController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Join Room",
          style: TextStyle(
            fontSize: getResposiveSize(context, fontSize: 30),
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20),
        Container(
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

          child: TextField(
            controller: roomIdController,
            decoration: const InputDecoration(
              hintText: 'Enter room ID',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        ButtonWidget(text: "Join", onPressed: () {}),
      ],
    );
  }
}
