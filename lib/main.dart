import 'package:flutter/material.dart';
import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/features/video_call/presentation/view/pages/video_call_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final client = StreamVideo(
    'mmhfdzb5evj2',
    user: User.regular(
      userId: 'Familiar_Canopy',
      role: 'admin',
      name: 'John Doe',
    ),
    userToken:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL0ZhbWlsaWFyX0Nhbm9weSIsInVzZXJfaWQiOiJGYW1pbGlhcl9DYW5vcHkiLCJ2YWxpZGl0eV9pbl9zZWNvbmRzIjo2MDQ4MDAsImlhdCI6MTc1NDQxMzQ0OSwiZXhwIjoxNzU1MDE4MjQ5fQ.BPquv0fmz-Za3ZELBWRutxHQtmMdXTf8tiwtfW7ls-I',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: VideoCallHomeScreen(),
    );
  }
}
