import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> tyres(BoxConstraints constrains) {
  return [
    Positioned(
      left: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.22,
      child: SvgPicture.asset('assets/icons/fl_tyre.svg'),
    ),
    Positioned(
      right: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.22,
      child: SvgPicture.asset('assets/icons/fl_tyre.svg'),
    ),
    Positioned(
      left: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.63,
      child: SvgPicture.asset('assets/icons/fl_tyre.svg'),
    ),
    Positioned(
      right: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.63,
      child: SvgPicture.asset('assets/icons/fl_tyre.svg'),
    ),
  ];
}
