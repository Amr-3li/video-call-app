import 'package:flutter/material.dart';
import 'package:vedio_call/core/constants/icons.dart';
import 'package:vedio_call/presentation/views/widgets/icon_container.dart';

class OtherRegister extends StatelessWidget {
  const OtherRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [IconContainer(icon: MyIcons.google, onTap: () {})],
    );
  }
}
