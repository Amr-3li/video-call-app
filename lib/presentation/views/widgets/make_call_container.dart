import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedio_call/core/constants/strings.dart';
import 'package:vedio_call/data/services/auth/auth_services_impl.dart';
import 'package:vedio_call/data/services/video_call/make_call_impl.dart';
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
    return Container();
  }
}
