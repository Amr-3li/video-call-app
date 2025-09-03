import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/new_meeting_page.dart';

import '../../../core/constants/animations.dart';
import '../../../core/constants/colors.dart';
import '../../../core/services/animation_of_routs.dart';
import '../../../core/services/font_size_handeler.dart';

class CreateRoomContainer extends StatelessWidget {
  const CreateRoomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(99, 218, 218, 218),
              child: Lottie.asset(
                fit: BoxFit.fill,
                Animations.workFromHome,
                height: height * 0.3,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Create Room ",
              style: TextStyle(
                fontSize: getResposiveSize(context, fontSize: 30),
                fontWeight: FontWeight.bold,
                color: MyColors.textColorwhite,
              ),
            ),
          ),
          Positioned(
            left: width * 0.08,
            right: width * 0.08,
            bottom: 20,

            child: ButtonWidget(
              text: "+ create & share code",
              onPressed: () {
                Navigator.push(
                  context,
                  PageAnimations.slide(NewMeetingScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
