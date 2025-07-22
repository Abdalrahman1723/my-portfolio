import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ScreenType {
  final BuildContext context;
  ScreenType({required this.context});

  bool get isDesktop => ResponsiveBreakpoints.of(context).isDesktop;
  bool get isTablet => ResponsiveBreakpoints.of(context).isTablet;
  bool get isMobile => ResponsiveBreakpoints.of(context).isMobile;

  bool get isExactlyDesktop => ResponsiveBreakpoints.of(context).equals(DESKTOP);
  bool get isLargerThanMobile => ResponsiveBreakpoints.of(context).largerThan(MOBILE);
  bool get isSmallerThanTablet => ResponsiveBreakpoints.of(context).smallerThan(TABLET);
  bool get isBetweenMobileAndTablet => ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);
}
