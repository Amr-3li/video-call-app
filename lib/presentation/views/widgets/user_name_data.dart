import 'package:flutter/material.dart';
import 'package:vedio_call/presentation/views/widgets/input_iext_widget.dart';

class UserNameData extends StatelessWidget {
  const UserNameData({
    super.key,
    required this.fNameController,
    required this.lNameController,
  });

  final TextEditingController fNameController;
  final TextEditingController lNameController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            child: InputTextWidget(
              controller: fNameController,
              hintText: "First Name",
              icon: const IconButton(
                onPressed: null,
                icon: Icon(Icons.person_outline),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: InputTextWidget(
              controller: lNameController,
              hintText: "Last Name",
            ),
          ),
        ],
      ),
    );
  }
}
