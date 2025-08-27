import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/core/constants/strings.dart';
import 'package:vedio_call/data/services/make_call_impl.dart';
import 'package:vedio_call/presentation/cubit/make_call/make_call_cubit.dart';
import 'package:vedio_call/presentation/views/widgets/custom_buttom.dart';
import 'package:vedio_call/presentation/views/widgets/custum_TextField.dart';
import 'package:vedio_call/presentation/views/widgets/home_informations.dart';

class MakeCallContainer extends StatelessWidget {
  MakeCallContainer({super.key});

  final TextEditingController _callIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        HomeInformations(),

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
                  lable: Strings.userName,
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        callIdController: _callIdController,
                        lable: Strings.callId,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        onPressed: () async {
                          MakeCallImpl().generateCallId();
                        },
                        text: Strings.generate,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                CustomButton(
                  text: 'Join',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      context.read<MakeCallCubit>().makeCall(
                        _callIdController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
