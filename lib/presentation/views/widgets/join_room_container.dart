import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vedio_call/core/services/animation_of_routs.dart';
import 'package:vedio_call/core/services/permesions_checker.dart';
import 'package:vedio_call/presentation/cubit/make_call/make_call_cubit.dart';
import 'package:vedio_call/presentation/views/pages/call_page.dart';
import 'package:vedio_call/presentation/views/widgets/button_widget.dart';

class JoinRoomContainer extends StatelessWidget {
  const JoinRoomContainer({
    super.key,
    required this.formKey,
    required this.roomIdController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController roomIdController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        BlocConsumer<MakeCallCubit, MakeCallState>(
          listener: (context, state) {
            if (state is MakeCallSuccess) {
              Navigator.push(
                context,
                PageAnimations.routeTransition(CallPage(call: state.call)),
              );
            }
          },
          builder: (context, state) {
            if (state is MakeCallLoading) {
              return const Skeletonizer(child: ButtonWidget(text: "Join"));
            }
            return ButtonWidget(
              text: "Join",
              onPressed: () async {
                print("room id ${roomIdController.text}");
                if (formKey.currentState!.validate()) {
                  await PermissionsChecker.checkPermissions(context);
                  await BlocProvider.of<MakeCallCubit>(
                    context,
                  ).makeCall(roomIdController.text);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
