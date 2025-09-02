import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

import '../widgets/create_room_container.dart';
import '../widgets/join_room_container.dart';

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

