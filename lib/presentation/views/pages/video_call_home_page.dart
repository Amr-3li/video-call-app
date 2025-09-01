import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vedio_call/core/constants/animations.dart';
import 'package:vedio_call/core/constants/colors.dart';
import 'package:vedio_call/core/services/font_size_handeler.dart';
import 'package:vedio_call/presentation/views/widgets/background_app.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';
import 'package:vedio_call/presentation/views/widgets/row_appbaer.dart';

class VideoCallHomeScreen extends StatelessWidget {
  const VideoCallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.heightOf(context);
    double width = MediaQuery.widthOf(context);
    return Scaffold(
      body: BackgroundApp(
        child: Column(
          children: [
            RowAppbar(title: "Home"),
            Padding(
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Create Room ",
                      style: TextStyle(
                        fontSize: getResposiveSize(fontSize: 40),
                        fontWeight: FontWeight.bold,
                        color: MyColors.textColorwhite,
                      ),
                    ),
                  ),
                  Positioned(
                    left: width * 0.15,
                    right: width * 0.15,
                    bottom: 20,

                    child: ButtonWidget(
                      text: "+ create & share code",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
