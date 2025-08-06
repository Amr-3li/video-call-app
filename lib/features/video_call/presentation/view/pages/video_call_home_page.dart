// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/core/constants/animations/animations.dart';
import 'package:vedio_call/features/video_call/presentation/view/pages/call_page.dart';
import 'package:vedio_call/features/video_call/presentation/view/widgets/custom_buttom.dart';
import 'package:vedio_call/features/video_call/presentation/view/widgets/custum_TextField.dart';

class VideoCallHomeScreen extends StatefulWidget {
  const VideoCallHomeScreen({super.key});

  @override
  State<VideoCallHomeScreen> createState() => _VideoCallHomeScreenState();
}

class _VideoCallHomeScreenState extends State<VideoCallHomeScreen> {
  final TextEditingController _callIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String _callId = '';
  bool _isGeneratingId = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _generateCallId();
    _userNameController.text = 'user123';
  }

  void _generateCallId() {
    setState(() {
      _isGeneratingId = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _callId = _generateRandomId();
        _callIdController.text = _callId;
        _isGeneratingId = false;
      });
    });
  }

  String _generateRandomId() {
    final random = Random();
    return '${random.nextInt(9000) + 1000}${random.nextInt(9000) + 1000}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: LottieBuilder.asset(
              Animations.backgroundAnimation,
              fit: BoxFit.fitHeight,
              repeat: true,
              reverse: true,
            ),
          ),

          Column(
            children: [
              const Spacer(),
              Text.rich(
                TextSpan(
                  text: 'Video ',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 149, 1, 212),
                  ),
                  children: [
                    TextSpan(
                      text: 'Call',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'You can create a call eith group by creating a call id and share the call id with your friend to injoi by the meating',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 50, 111),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        callIdController: _userNameController,
                        lable: "User Name",
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomTextField(
                              callIdController: _callIdController,
                              lable: "User Name",
                            ),
                          ),
                          SizedBox(width: 10.0),
                          _isGeneratingId
                              ? CircularProgressIndicator()
                              : Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    onPressed: () {
                                      _isGeneratingId = true;
                                      _generateCallId();
                                    },
                                    text: 'Generate',
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      CustomButton(
                        text: 'Join',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              var call = StreamVideo.instance.makeCall(
                                callType: StreamCallType(),
                                id: _callId,
                              );

                              await call.getOrCreate();

                              // Created ahead
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CallPage(call: call),
                                ),
                              );
                            } catch (e) {
                              debugPrint('Error joining or creating call: $e');
                              debugPrint(e.toString());
                            }
                          } else {
                            debugPrint('Form is not valid');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _callIdController.dispose();
    _userNameController.dispose();
    super.dispose();
  }
}
