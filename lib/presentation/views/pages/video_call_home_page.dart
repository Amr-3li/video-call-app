import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vedio_call/core/services/font_size_handeler.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

import '../widgets/create_room_container.dart';

class VideoCallHomeScreen extends StatelessWidget {
  const VideoCallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BackgroundApp(
        child: Column(
          children: [
            RowAppbar(title: "Home"),
            CreateRoomContainer(),
            JoinRoomContainer(),
          ],
        ),
      ),
    );
  }
}

class JoinRoomContainer extends StatelessWidget {
  const JoinRoomContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
        TextFormField(
          onTapUpOutside:  (event) =>  FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            enabledBorder:  OutlineInputBorder()
          ),
        ),
      ],
    );
  }
}
