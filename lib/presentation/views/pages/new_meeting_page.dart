import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vedio_call/core/dapendency_injection/get_it.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/core/services/permesions_checker.dart';
import 'package:vedio_call/data/repo/video_call/make_call_repo.dart';
import 'package:vedio_call/presentation/cubit/generate_call_id/generate_call_id_cubit.dart';
import 'package:vedio_call/presentation/cubit/make_call/make_call_cubit.dart';
import 'package:vedio_call/presentation/views/pages/call_page.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';

class NewMeetingScreen extends StatelessWidget {
  const NewMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String meetingId = '';
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Meeting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 60),
            BlocBuilder<GenerateCallIdCubit, GenerateCallIdState>(
              builder: (context, state) {
                if (state is GenerateCallIdSuccess) {
                  // meetingId = state.callId;
                  return Column(
                    children: [
                      _buildMeetingId(state.callId),
                      const SizedBox(height: 40),
                      _buildActionButtons(context, callId: state.callId),
                    ],
                  );
                } else {
                  return Skeletonizer(
                    child: Column(
                      children: [
                        _buildMeetingId("..."),
                        const SizedBox(height: 40),
                        _buildActionButtons(context, callId: meetingId),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'Get a link to share',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Anyone with the link can join the meeting.',
          style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.4),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMeetingId(String meetingId) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FittedBox(
        child: Text(
          meetingId,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, {required String callId}) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => MakeCallCubit(getIt<MakeCallRepo>()),
          child: BlocConsumer<MakeCallCubit, MakeCallState>(
            listener: (context, state) {
              if (state is MakeCallSuccess) {
                Navigator.push(
                  context,
                  PageAnimations.routeTransition(CallPage(call: state.call)),
                );
              }
            },
            builder: (context, state) {
              return state is MakeCallLoading
                  ? const Skeletonizer(child: ButtonWidget(text: "Join"))
                  : _buildPrimaryButton(
                      context,
                      label: 'Join Meeting',
                      icon: Icons.video_call,
                      onPressed: () => _onJoinMeeting(context, callId: callId),
                    );
            },
          ),
        ),
        const SizedBox(height: 12),
        _buildSecondaryButton(
          context,
          label: 'Copy Link',
          icon: Icons.link,
          onPressed: () => _onCopyLink(context, meetingLink: callId),
        ),
        const SizedBox(height: 12),
        _buildSecondaryButton(
          context,
          label: 'Share Invite',
          icon: Icons.share,
          onPressed: () => _onShareInvite(context),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B47F5),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20, color: Colors.black54),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black54,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Future<void> _onJoinMeeting(
    BuildContext context, {
    required String callId,
  }) async {
    await PermissionsChecker.checkPermissions(context);
    await BlocProvider.of<MakeCallCubit>(context).makeCall(callId);
  }

  void _onCopyLink(BuildContext context, {required String meetingLink}) {
    Clipboard.setData(ClipboardData(text: meetingLink));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Meeting link copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onShareInvite(BuildContext context) {
    // Implement share functionality
    // You might want to use the share_plus package for this
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Opening share dialog...')));
  }
}

// Usage example in your main app
class MeetingApp extends StatelessWidget {
  const MeetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display', // or your preferred font
      ),
      home: const NewMeetingScreen(),
    );
  }
}
