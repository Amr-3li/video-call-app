import 'dart:ui';

double getResposiveSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();

  double sizeResponsive = fontSize * scaleFactor;
  double lowerLimit = sizeResponsive * 0.8;
  double upperLimit = sizeResponsive * 1.2;
  return sizeResponsive.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  var disPatcher = PlatformDispatcher.instance;
  var phisicalWidth = disPatcher.views.first.physicalSize.width;
  var devicePixelRatio = disPatcher.views.first.devicePixelRatio;
  double width = phisicalWidth / devicePixelRatio;
  if (width < 600) {
    return width / 400;
  } else if (width < 1200) {
    return width / 900;
  } else {
    return width / 1000;
  }
}
