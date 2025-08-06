import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide RadialGradient, LinearGradient;
import 'package:stream_video/stream_video.dart';
import 'package:vedio_call/features/video_call/presentation/view/pages/call_page.dart';
import 'package:confetti/confetti.dart';
import 'package:rive/rive.dart' hide RadialGradient, LinearGradient;

class VideoCallHomeScreen extends StatefulWidget {
  @override
  _VideoCallHomeScreenState createState() => _VideoCallHomeScreenState();
}

class _VideoCallHomeScreenState extends State<VideoCallHomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _callIdController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;
  late ConfettiController _confettiController;
  late RiveAnimationController _riveController;
  String _callId = '';
  bool _isGeneratingId = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _confettiController = ConfettiController(duration: Duration(seconds: 5));
    _riveController = SimpleAnimation('idle');
    _generateCallId();
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
        _confettiController.play();
      });
    });
  }

  String _generateRandomId() {
    final random = Random();
    return '${random.nextInt(9000) + 1000}${random.nextInt(9000) + 1000}';
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [Colors.indigo[900]!, Colors.black],
              ),
            ),
          ),
          Positioned.fill(
            child: RiveAnimation.asset(
              'assets/background_animation.riv',
              fit: BoxFit.cover,
              controllers: [_riveController],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.purpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.videocam_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    Text(
                      'Your Call ID',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blueAccent.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: _isGeneratingId
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Generating...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )
                          : TextField(
                              controller: _callIdController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Call ID',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _callId = value;
                                });
                              },
                            ),
                    ),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.refresh, color: Colors.white70),
                      onPressed: _generateCallId,
                      tooltip: 'Generate new ID',
                    ),
                  ],
                ),
                SizedBox(height: 60),
                ScaleTransition(
                  scale: _animation,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      elevation: 10,
                      shadowColor: Colors.greenAccent,
                    ),
                    onPressed: () async {
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
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.video_call, size: 28),
                        SizedBox(width: 10),
                        Text(
                          'Start Call',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.purple,
                Colors.orange,
                Colors.pink,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
