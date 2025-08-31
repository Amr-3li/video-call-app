import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.icon, this.onTap});
  final String icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(height: 40, width: 40, child: SvgPicture.asset(icon)),
    );
  }
}
