import 'package:flutter/material.dart';

double getResposiveSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);

  double sizeResponsive = fontSize * scaleFactor;
  double lowerLimit = sizeResponsive * 0.8;
  double upperLimit = sizeResponsive * 1.2;
  return sizeResponsive.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1200) {
    return width / 900;
  } else {
    return width / 1000;
  }
}
