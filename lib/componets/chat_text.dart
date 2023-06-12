import 'package:flutter/material.dart';

import '../utility/colors.dart';

class whiteText extends StatelessWidget {
  final String text;
  final double fontSize;
  final fontweight;
  final double? height;
  const whiteText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.fontweight,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.white,
          fontSize: fontSize,
          fontWeight: fontweight,
          height: height),
    );
  }
}
